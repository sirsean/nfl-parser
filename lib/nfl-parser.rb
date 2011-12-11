# A module for parsing the NFL API
module NflParser
    autoload :Download, "#{File.dirname(__FILE__)}/nfl-parser/Download.rb"
    autoload :Parse, "#{File.dirname(__FILE__)}/nfl-parser/Parse.rb"
    autoload :Game, "#{File.dirname(__FILE__)}/nfl-parser/Game.rb"
    autoload :Team, "#{File.dirname(__FILE__)}/nfl-parser/Team.rb"
end
