require 'bwapi/version'
require 'bwapi/configuration'

require 'allotment'
require 'faraday'

module BWAPI
  # Default module
  module Default
    ADAPTER      = Faraday.default_adapter

    API_ENDPOINT = 'https://newapi.brandwatch.com/'

    CLIENT_ID    = 'brandwatch-api-client'

    GRANT_TYPE   = 'api-password'

    USER_AGENT   = "BWAPI Ruby Gem #{BWAPI::VERSION}".freeze

    class << self
      def options
        Hash[BWAPI::Configuration.keys.map { |key| [key, send(key)] }]
      end

      def access_token
        ENV['BWAPI_ACCESS_TOKEN']
      end

      def adapter
        ENV['BWAPI_ADAPTER'] || ADAPTER
      end

      def api_endpoint
        ENV['BWAPI_API_ENDPOINT'] || API_ENDPOINT
      end

      def client_id
        ENV['BWAPI_CLIENT_ID'] || CLIENT_ID
      end

      def client_secret
        ENV['BWAPI_CLIENT_SECRET']
      end

      def connection_options
        {
          headers: {
            user_agent: user_agent
          },
          request: {
            params_encoder: Faraday::FlatParamsEncoder
          }
        }
      end

      def debug
        ENV['BWAPI_DEBUG'] || false
      end

      def grant_type
        ENV['BWAPI_GRANT_TYPE'] || GRANT_TYPE
      end

      def logger
        nil
      end

      def password
        ENV['BWAPI_PASSWORD']
      end

      def performance
        Allotment.results
      end

      def refresh_token
        ENV['BWAPI_REFRESH_TOKEN']
      end

      def user_agent
        ENV['BWAPI_USER_AGENT'] || USER_AGENT
      end

      def username
        ENV['BWAPI_USERNAME']
      end

      def verify_ssl
        ENV['BWAPI_VERIFY_SSL'] || false
      end
    end
  end
end