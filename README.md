# The Official DocuSign Monitor Client

[![RubyGems version][rubygems-image]][rubygems-url]
[![RubyGems downloads][downloads-image]][downloads-url]
[![Build status][travis-image]][travis-url]

## Requirements

- Ruby 1.9+
- Free [Developer Account](https://go.docusign.com/sandbox/productshot/?elqCampaignId=16531)

## Compatibility

- Ruby 1.9+

## Note

This open-source SDK is provided for cases where you would like to make additional changes that the SDK does not provide out-of-the-box. If you simply want to use the SDK with any of the examples shown in the [Developer Center](https://developers.docusign.com/esign-rest-api/code-examples), follow the installation instructions below.

## Installation

### Install via your application's **Gemfile**:

1. In your application's **Gemfile**, add:  
   **gem 'docusign_monitor'**
2. Open your preferred console.
3. In your project directory, execute the installer by typing:  
   **bundle install**

### Manual install:

1. Open your preferred console.
2. In the console, type:  
   **gem install docusign_monitor**

### Dependencies

This client has the following external dependencies:

- Jwt>=1.5.2
- Json>=2.1.0
- Typhoeus>=1.0.1

## Code Examples

### Launchers

DocuSign provides a sample application code referred to as a [Launcher](https://github.com/docusign/code-examples-ruby). The Launcher contains a set of 31 common use cases and associated source files. These examples use either DocuSign&#39;s [Authorization Code Grant](https://developers.docusign.com/esign-rest-api/guides/authentication/oauth2-code-grant) or [JSON Web Tokens (JWT)](https://developers.docusign.com/esign-rest-api/guides/authentication/oauth2-jsonwebtoken) flows.


## OAuth Implementations

For details regarding which type of OAuth grant will work best for your DocuSign integration, see the [REST API Authentication Overview](https://developers.docusign.com/esign-rest-api/guides/authentication) guide located on the [DocuSign Developer Center](https://developers.docusign.com/esign-rest-api/guides/authentication).

For Monitor API can only be used with JWT.


## Support

Log issues against this client through GitHub. We also have an [active developer community on Stack Overflow](https://stackoverflow.com/questions/tagged/docusignapi).

## License

The DocuSign Ruby Client is licensed under the [MIT License](https://github.com/docusign/docusign-ruby-client/blob/master/LICENSE).

[rubygems-image]: https://img.shields.io/gem/v/docusign_monitor.svg?style=flat
[rubygems-url]: https://rubygems.org/gems/docusign_monitor
[downloads-image]: https://img.shields.io/gem/dt/docusign_monitor.svg?style=flat
[downloads-url]: https://rubygems.org/gems/docusign_monitor
[travis-image]: https://img.shields.io/travis/docusign/docusign-monitor-ruby-client.svg?style=flat
[travis-url]: https://travis-ci.org/docusign/docusign-monitor-ruby-client

### Additional Resources
* [DocuSign Developer Center](https://developers.docusign.com)
* [DocuSign API on Twitter](https://twitter.com/docusignapi)
* [DocuSign For Developers on LinkedIn](https://www.linkedin.com/showcase/docusign-for-developers/)
* [DocuSign For Developers on YouTube](https://www.youtube.com/channel/UCJSJ2kMs_qeQotmw4-lX2NQ)
