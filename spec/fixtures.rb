require 'spec_helper'
require 'pathname'

module TestFixtures
    FIXTURES_PATH = Pathname.new(__FILE__).dirname + "fixtures"

    def self.read_fixture(filename)
        File.read("#{FIXTURES_PATH}/#{filename}")
    end

    GAME_FINAL = read_fixture("game_2011112400_game.js")

    ALL_WEEKS_14 = read_fixture("allWeeks.week14.js")

    SCHEDULE_WEEK_12 = read_fixture("week_reg_12_schedule.past.js")
    SCHEDULE_WEEK_14 = read_fixture("week_reg_14_schedule.in-progress.js")
end
