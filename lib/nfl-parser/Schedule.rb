module NFL
    class Schedule
        attr_reader :week, :games

        def initialize(parsed)
            @week = ScheduleWeek.new(parsed["week"])
            @games = parsed["content"].map do |game|
                NFL::Game.new(game)
            end
        end
    end

    class ScheduleWeek
        attr_reader :current, :next, :previous

        def initialize(parsed)
            @current = NFL::Week.new(parsed["current"])
            @next = NFL::Week.new(parsed["next"])
            @previous = NFL::Week.new(parsed["previous"])
        end
    end
end
