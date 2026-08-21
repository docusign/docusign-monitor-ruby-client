require 'docusign_monitor'
require 'base64'
require 'uri'
require 'addressable/uri'

describe 'DocuSign Ruby Client Tests' do
	def login
		begin
			if $api_client.nil?
				configuration = DocuSign_Monitor::Configuration.new
				configuration.host = $host

				$api_client = DocuSign_Monitor::ApiClient.new(configuration)
				$api_client.set_oauth_base_path(DocuSign_Monitor::OAuth::DEMO_OAUTH_BASE_PATH)

				# $api_client.get_authorization_uri($integrator_key,'signature',$return_url,'code')
				# $api_client.request_jwt_application_token($integrator_key,File.read($private_key_filename),$expires_in_seconds,'' )
				# code = 'code_here'
				# $api_client.generate_access_token($integrator_key,$secret,code)
			end

		decode_base64_content = Base64.decode64(ENV["PRIVATE_KEY"])
 		File.open($private_key_filename, "wb") do |f|
 		  f.write(decode_base64_content)
 		end
		  token_obj = $api_client.request_jwt_user_token(ENV["INTEGRATOR_KEY_JWT"],ENV["USER_ID"], File.read($private_key_filename),$expires_in_seconds,$scopes)
	  	user_info = $api_client.get_user_info(token_obj.access_token)

		if !user_info.nil?
			user_info.accounts.each do |account|
				if account.is_default == "true"
					$base_uri = account.base_uri
					$account_id = account.account_id
					$organization_id = account.organization.organization_id if account.organization

					# IMPORTANT: Use the base url from the login account to instantiant the api_client
					base_uri = Addressable::URI.parse($base_uri)
					# $api_client.set_base_path( "%s://%s/restapi" % [base_uri.scheme, base_uri.host])

					return account
				end
			end
		end
		rescue => e
		  puts "Error during processing: #{$!}"
		  # puts "Backtrace:\n\t#{e.backtrace.join("\n\t")}"
		end

		return nil
	end

	def create_api_client
		if $api_client.nil?
			self.login()
		end

		return $api_client
	end

  before(:all) do
    # run before each test
    $host = "https://api-d.docusign.com"

  	$expires_in_seconds = 3600 #1 hour
  	$auth_server = 'account-d.docusign.com'
  	$private_key_filename = '../docs/private.pem'
    
    $recipient_name = "Ruby SDK"

    # Required for embedded signing url
    $client_user_id = '1234'
    $return_url = 'https://developers.docusign.com/'
    $authentication_method = 'email'
	    
    $template_id = ''
    $envelope_id = nil

    $base_uri = nil
    $account_id = nil
    $organization_id = nil
	$api_client = nil

	$scopes = ["signature"]
  end

  after do
    # run after each test
  end

  describe DocuSign_Monitor::OAuth do
  	describe '.login' do
  		context 'given correct credentials' do
  			it 'return Account' do
  				account = login()

				if !account.nil?
					$base_uri = account.base_uri
					$account_id = account.account_id
					$organization_id = account.organization.organization_id if account.organization
				end

				expect($account_id).to be_truthy
				expect($base_uri).to be_truthy
				expect($organization_id).to be_truthy
  			end
  		end
  	end
  end

  describe DocuSign_Monitor::DocuMonitorApi do
  	describe '.stream' do
  		context 'organization stream' do
  			it 'successfully returns monitor stream' do
				api_client = create_api_client()
				docu_monitor_api = DocuSign_Monitor::DocuMonitorApi.new(api_client)

				stream_options = DocuSign_Monitor::StreamOptions.new
				stream_options.cursor = (Time.now - 24 * 60 * 60).utc.strftime('%Y-%m-%dT%H:%M:%SZ')
				stream_options.limit = 100

				stream_response = docu_monitor_api.stream($organization_id, stream_options)

				expect(stream_response).to be_truthy
				expect(stream_response.end_cursor).to be_truthy
  			end
  		end
  	end
end
end
