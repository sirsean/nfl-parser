module NFL
    class Game
        attr_reader :game_id, :label, :game_clock, :quarter, :season_type, :stadium, :status, :tv_network
        attr_reader :inside_twenty, :is_final, :is_halftime, :is_in_progress, :is_pre_game, :period_count, :season, :week_number, :crossed_redzone, :has_just_scored
        attr_reader :datetime, :datetime_date, :datetime_time
        attr_reader :weather, :temperatures, :conditions
        attr_reader :possession_team
        attr_reader :winner
        attr_reader :away_team, :away_score, :away_q1_score, :away_q2_score, :away_q3_score, :away_q4_score, :away_ot_score, :away_team_timeouts_remaining, :away_team_record
        attr_reader :away_team_wins, :away_team_losses, :away_team_ties
        attr_reader :home_team, :home_score, :home_q1_score, :home_q2_score, :home_q3_score, :home_q4_score, :home_ot_score, :home_team_timeouts_remaining, :home_team_record
        attr_reader :home_team_wins, :home_team_losses, :home_team_ties

        def initialize(parsed)
            @game_id = parsed["id"]
            @label = parsed["label"]
            @game_clock = parsed["gameClock"]
            @quarter = parsed["quarter"]
            @season_type = parsed["seasonType"]
            @stadium = parsed["stadium"]
            @status = parsed["status"]
            @tv_network = parsed["tvNetwork"]
            @inside_twenty = parsed["insideTwenty"]
            @is_final = parsed["isFinal"]
            @is_halftime = parsed["isHalftime"]
            @is_in_progress = parsed["isInProgress"]
            @is_pre_game = parsed["isPreGame"]
            @period_count = parsed["periodCount"]
            @season = parsed["season"]
            @week_number = parsed["weekNumber"]
            @crossed_redzone = parsed["crossedRedZone"]
            @datetime = parsed["dateTime"]
            @datetime_time = parsed["dateTime_time"]
            @datetime_date = parsed["dateTime_date"]
            @has_just_scored = parsed["hasJustScored"]
            @weather = parsed["weather"]
            @temperatures = parsed["temperatures"]
            @conditions = parsed["conditions"]
            @possession_team = NFL::Team.new(parsed["possessionTeam"])
            @winner = NFL::Team.new(parsed["winner"])
            @away_team = NFL::Team.new(parsed["awayTeam"])
            @away_score = parsed["awayScore"]
            @away_q1_score = parsed["awayQ1Score"]
            @away_q2_score = parsed["awayQ2Score"]
            @away_q3_score = parsed["awayQ3Score"]
            @away_q4_score = parsed["awayQ4Score"]
            @away_ot_score = parsed["awayOtScore"]
            @away_team_timeouts_remaining = parsed["awayTeamTimeoutsRemaining"]
            @away_team_record = parsed["awayTeamRecord"]
            if parsed["awayTeamRecord"]
                away_team_record_split = parsed["awayTeamRecord"].split('-')
                @away_team_wins = away_team_record_split[0].to_i
                @away_team_losses = away_team_record_split[1].to_i
                @away_team_ties = away_team_record_split[2].to_i
            end
            @home_team = NFL::Team.new(parsed["homeTeam"])
            @home_score = parsed["homeScore"]
            @home_q1_score = parsed["homeQ1Score"]
            @home_q2_score = parsed["homeQ2Score"]
            @home_q3_score = parsed["homeQ3Score"]
            @home_q4_score = parsed["homeQ4Score"]
            @home_ot_score = parsed["homeOtScore"]
            @home_team_timeouts_remaining = parsed["homeTeamTimeoutsRemaining"]
            @home_team_record = parsed["homeTeamRecord"]
            if parsed["homeTeamRecord"]
                home_team_record_split = parsed["homeTeamRecord"].split('-')
                @home_team_wins = home_team_record_split[0].to_i
                @home_team_losses = home_team_record_split[1].to_i
                @home_team_ties = home_team_record_split[2].to_i
            end
        end
    end
end
