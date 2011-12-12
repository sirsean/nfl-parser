require "net/http"
require "uri"

module NFL
    module Download
        class DownloaderBase
            def download
                url = URI.parse(build_url)
                request = Net::HTTP::Get.new(url.path)
                response = Net::HTTP.start(url.host, url.port) do |http|
                    http.request(request)
                end

                response.body
            end
        end

        class GameDownloader < DownloaderBase
            def initialize(game_id)
                @game_id = game_id
            end

            def build_url
                "http://s3.amazonaws.com/nflgc/game_#{@game_id}_game.js"
            end
        end

        class AllWeeksDownloader < DownloaderBase
            def build_url
                "http://s3.amazonaws.com/nflgc/allWeeks.js"
            end
        end

        class ScheduleDownloader < DownloaderBase
            def initialize(options)
                if options.has_key?(:week)
                    @season_type = options[:week].season_type
                    @week_number = options[:week].week
                end

                if options.has_key?(:season_type)
                    @season_type = options[:season_type]
                end
                if options.has_key?(:week_number)
                    @week_number = options[:week_number]
                end
            end

            def build_url
                "http://s3.amazonaws.com/nflgc/week_#{@season_type}_#{@week_number}_schedule.js"
            end
        end
    end
end
