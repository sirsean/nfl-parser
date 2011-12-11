require "json"

module NflParser
    module Parse
        class GameParser
            def parse(json)
                parsed = JSON.parse(json)
                NflParser::Game.new(parsed["content"])
            end
        end

        class AllWeeksParser
            def parse(json)
                parsed = JSON.parse(json)
                NflParser::AllWeeks.new(parsed)
            end
        end

        class ScheduleParser
            def parse(json)
                parsed = JSON.parse(json)
                NflParser::Schedule.new(parsed)
            end
        end
    end
end
