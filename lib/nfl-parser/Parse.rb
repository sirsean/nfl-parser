require "json"

module NflParser
    module Parse
        class GameParser
            def parse(json_string)
                parsed = JSON.parse(json_string)
                NflParser::Game.new(parsed["content"])
            end
        end
    end
end
