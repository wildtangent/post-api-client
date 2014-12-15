module Post
  module Api
    module Client
      class Analytics

        def initialize(api_key)
          @api_key = api_key
          @connection = Connection.new(@@api_url)
        end

        private
        def default_params
          {
            apiKey: @api_key
          }
        end

      end
    end
  end
end
