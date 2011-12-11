require 'spec_helper'

describe NflParser::Parse::AllWeeksParser do
    before :each do
        @all_weeks_14 = TestFixtures::ALL_WEEKS_14
    end

    it "gets the current week" do
        parser = NflParser::Parse::AllWeeksParser.new
        all_weeks = parser.parse(@all_weeks_14)

        all_weeks.current.season.should == 2011
        all_weeks.current.week.should == 14
        all_weeks.current.season_type.should == "reg"
        all_weeks.current.week_name.should == "Week 14"
    end

    it "gets all the weeks" do
        parser = NflParser::Parse::AllWeeksParser.new
        all_weeks = parser.parse(@all_weeks_14)

        all_weeks.weeks.size.should == 17

        all_weeks.weeks[0].week_name.should == "Week 1"
    end

    it "correctly compares the current week" do
        parser = NflParser::Parse::AllWeeksParser.new
        all_weeks = parser.parse(@all_weeks_14)

        all_weeks.current.should == all_weeks.weeks[13]
    end
end
