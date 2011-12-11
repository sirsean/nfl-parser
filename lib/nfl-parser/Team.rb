module NflParser
    class Team
        attr_reader :team_id, :name, :nickname, :abbreviation, :city, :conference, :division, :image_url, :draft_needs

        def initialize(parsed)
            @team_id = parsed["id"]
            @name = parsed["name"]
            @nickname = parsed["nickName"]
            @abbreviation = parsed["abbreviation"]
            @city = parsed["city"]
            @conference = parsed["conference"]
            @division = parsed["division"]
            @image_url = parsed["imageUrl"]
            @draft_needs = parsed["draftNeeds"].split(",")
        end
    end
end
