require "json"

module NFL
    module Parse
        class GameParser
            def parse(json)
                parsed = JSON.parse(json)
                NFL::Game.new(parsed["content"])
            end
        end

        class AllWeeksParser
            def parse(json)
                parsed = JSON.parse(json)
                NFL::AllWeeks.new(parsed)
            end
        end

        class ScheduleParser
            def parse(json)
                parsed = JSON.parse(json)
                NFL::Schedule.new(parsed)
            end
        end
    end
end
