require 'spec_helper'
require 'pathname'

module TestFixtures
    FIXTURES_PATH = Pathname.new(__FILE__).dirname + "fixtures"

    def self.read_fixture(filename)
        File.read("#{FIXTURES_PATH}/#{filename}")
    end

    GAME_FINAL = read_fixture("game_2011112400_game.js")
end
