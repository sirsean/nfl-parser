require "net/http"
require "uri"

module NflParser
    module Download
        class GameDownloader
            def initialize(game_id)
                @game_id = game_id
            end

            def download
                url = URI.parse(build_url)
                request = Net::HTTP::Get.new(url.path)
                response = Net::HTTP.start(url.host, url.port) do |http|
                    http.request(request)
                end

                response.body
            end

            def build_url
                "http://s3.amazonaws.com/nflgc/game_#{@game_id}_game.js"
            end
        end
    end
end
