module NflParser
    class AllWeeks
        attr_reader :current, :weeks

        def initialize(parsed)
            @current = NflParser::Week.new(parsed["current"])
            @weeks = parsed["content"].map do |week|
                NflParser::Week.new(week)
            end
        end
    end

    class Week
        attr_reader :season_type, :season, :week, :week_name

        def initialize(parsed)
            @season_type = parsed["type"]
            @season = parsed["season"]
            @week = parsed["week"]
            @week_name = parsed["weekName"]
        end

        def ==(other)
            @season_type == other.season_type and @season == other.season and @week == other.week
        end
    end
end
