require "spec_helper"

describe NFL::Parse::ScheduleParser do
    before :each do
        @schedule_week_12 = TestFixtures::SCHEDULE_WEEK_12
        @schedule_week_14 = TestFixtures::SCHEDULE_WEEK_14
    end

    context "past week" do
        it "gets the current/previous/next weeks" do
            parser = NFL::Parse::ScheduleParser.new
            schedule = parser.parse(@schedule_week_12)

            schedule.week.current.week.should == 12
            schedule.week.previous.week.should == 11
            schedule.week.next.week.should == 13
        end

        it "gets the right number of games" do
            parser = NFL::Parse::ScheduleParser.new
            schedule = parser.parse(@schedule_week_12)

            schedule.games.size.should == 16
        end

        it "gets the first game" do
            parser = NFL::Parse::ScheduleParser.new
            schedule = parser.parse(@schedule_week_12)

            game = schedule.games[0]
            game.game_id.should == "2011112400"
            game.label.should == "GB @ DET"
            game.game_clock.should == ":00"
            game.season_type.should == "reg"
            game.stadium.should == "Ford Field"
            game.status.should == "Final"
            game.tv_network.should == "FOX"
            game.inside_twenty.should == false
            game.is_final.should == true
            game.is_halftime.should == false
            game.is_in_progress.should == false
            game.is_pre_game.should == false
            game.period_count.should == 4
            game.season.should == 2011
            game.week_number.should == 12
            game.crossed_redzone.should == false
            game.datetime.should == "2011-11-24T09:30:00.000-08:00"
            game.datetime_time.should == "12:30 PM ET"
            game.datetime_date.should == "Thu, Nov 24"
            game.has_just_scored.should == false
            game.weather.should == "Light Fog Temp: 39  F, Wind: WSW 12 mph"
            game.temperatures.should == "Light Fog: 39F"
            game.conditions.should == "Wind: WSW 12 mph"
            game.winner.name.should == "Green Bay Packers"
            game.away_team.name.should == "Green Bay Packers"
            game.away_score.should == 27
            game.away_q1_score.should == 0
            game.away_q2_score.should == 7
            game.away_q3_score.should == 17
            game.away_q4_score.should == 3
            game.away_ot_score.should == 0
            game.away_team_timeouts_remaining.should == 3
            game.away_team_record.should == "11-0-0"
            game.home_team.name.should == "Detroit Lions"
            game.home_score.should == 15
            game.home_q1_score.should == 0
            game.home_q2_score.should == 0
            game.home_q3_score.should == 0
            game.home_q4_score.should == 15
            game.home_ot_score.should == 0
            game.home_team_timeouts_remaining.should == 0
            game.home_team_record.should == "7-4-0"
        end
    end

    context "current week" do
        it "gets the right number of games" do
            parser = NFL::Parse::ScheduleParser.new
            schedule = parser.parse(@schedule_week_14)

            schedule.games.size.should == 16
        end

        it "has the currently in-progress game (Sunday Night) first" do
            parser = NFL::Parse::ScheduleParser.new
            schedule = parser.parse(@schedule_week_14)

            game = schedule.games.first

            game.away_team.name.should == "New York Giants"
            game.home_team.name.should == "Dallas Cowboys"

            game.away_score.should == 2
            game.home_score.should == 0
        end
    end

end
