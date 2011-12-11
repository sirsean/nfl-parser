module NflParser
    class Schedule
        attr_reader :week, :games

        def initialize(parsed)
            @week = ScheduleWeek.new(parsed["week"])
            @games = parsed["content"].map do |game|
                NflParser::Game.new(game)
            end
        end
    end

    class ScheduleWeek
        attr_reader :current, :next, :previous

        def initialize(parsed)
            @current = NflParser::Week.new(parsed["current"])
            @next = NflParser::Week.new(parsed["next"])
            @previous = NflParser::Week.new(parsed["previous"])
        end
    end
end
