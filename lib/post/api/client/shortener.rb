
module Post
  module Api
    module Client
      class Shortener

        @@api_url = "http://po.st/"

        def initialize(api_key)
          @api_key = api_key
          @connection = Connection.new(@@api_url)
        end

        def shorten(params={})
          params.merge!(default_params)
          @connection.get("/api/shorten", params).body
        end

        def customize(params={})
          custom_hash = params.delete(:custom)
          params.merge!(default_params)
          shortened = shorten(params)
          if shortened["status_txt"] == "OK"
            params = {
              customHash: custom_hash,
              hash: shortened['hash']
            }.merge!(default_params)
            @connection.get("/api/customize", params).body
          end
        end

        def expand(params={})
          params.merge!(default_params)
          @connection.get("/api/expand", params)
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
