require 'spec_helper'

describe NflParser::Parse::GameParser do
    before :each do
        @game_final = TestFixtures::GAME_FINAL
    end

    it "parses a game, final" do
        parser = NflParser::Parse::GameParser.new
        game = parser.parse(@game_final)
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

    it "parses all the fields out of the team" do
        parser = NflParser::Parse::GameParser.new
        game = parser.parse(@game_final)

        game.away_team.team_id.should == "1800"
        game.away_team.name.should == "Green Bay Packers"
        game.away_team.nickname.should == "Packers"
        game.away_team.abbreviation.should == "GB"
        game.away_team.city.should == "Green Bay"
        game.away_team.conference.should == "NFC"
        game.away_team.division.should == "North"
        game.away_team.image_url.should == "http://s3.amazonaws.com/nflgc-images/ws/team_icons/icon_team_gb.png"
        game.away_team.draft_needs.should == ["DL","LB","OL","CB","RB"]

        game.home_team.team_id.should == "1540"
        game.home_team.name.should == "Detroit Lions"
        game.home_team.nickname.should == "Lions"
        game.home_team.abbreviation.should == "DET"
        game.home_team.city.should == "Detroit"
        game.home_team.conference.should == "NFC"
        game.home_team.division.should == "North"
        game.home_team.image_url.should == "http://s3.amazonaws.com/nflgc-images/ws/team_icons/icon_team_det.png"
        game.home_team.draft_needs.should == ["CB","LB","S","OL","RB","WR"]

        game.winner.team_id.should == game.away_team.team_id
    end

    it "builds a team with no draft needs" do
        team = NflParser::Team.new({})
        team.draft_needs.should == []
    end

end
