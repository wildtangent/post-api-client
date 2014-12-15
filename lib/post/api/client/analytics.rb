module Post
  module Api
    module Client
      class Analytics

        @@api_url = "http://api.po.st/"
        @@base_path = "/analytics/v1"

        def initialize(publisher_key, access_token)
          @publisher_key = publisher_key
          @access_token = access_token
          @connection = Connection.new(@@api_url)
        end

        def daily(params={})
          params.merge!(default_params)
          @connection.get(path("/daily"), params).body['rows']
        end

        def content(params={})
          params.merge!(default_params)
          @connection.get(path("/content"), params).body['rows']
        end

        def services(params={})
          params.merge!(default_params)
          @connection.get(path("/services"), params).body['rows']
        end

        def country(params={})
          params.merge!(default_params)
          @connection.get(path("/country"), params).body['rows']
        end

        private

        def path(p)
          [@@base_path, p, ".json"].join("")
        end

        def default_params
          {
            "access-token" => @access_token,
            "pubkey" => @publisher_key
          }
        end

      end
    end
  end
end
