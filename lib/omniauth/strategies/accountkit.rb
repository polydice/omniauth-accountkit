require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AccountKit < OmniAuth::Strategies::OAuth2
      option :client_options, {
          site: "https://graph.accountkit.com/v1.2/",
          authorize_url: "https://www.accountkit.com/v1.2/basic/dialog/sms_login/",
          token_url: "access_token",
          token_method: :get
      }

      option :provider_ignores_state, true

      def request_phase
        redirect client.auth_code.authorize_url({app_id: options.client_id, redirect: callback_url}.merge(authorize_params))
      end

      def authorize_params
        super.tap do |params|
          params["fbAppEventsEnabled"] = true
        end
      end

      def token_params
        super.tap do |params|
          params["access_token"] = app_access_token
        end
      end

      uid { raw_info['id'] }

      info do
        {
            number: raw_info['phone']['number'],
            country_prefix: raw_info['phone']['country_prefix'],
            national_number: raw_info['phone']['national_number']
        }
      end

      extra do
        {
            raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end

      protected

      def build_access_token
        verifier = request.params["code"]
        client.auth_code.get_token(verifier, token_params.to_hash(symbolize_keys: true), deep_symbolize(options.auth_token_params))
      end

      private

      def app_access_token
        "AA|#{options.client_id}|#{options.client_secret}"
      end
    end
  end
end

OmniAuth.config.add_camelization 'accountkit', 'AccountKit'
