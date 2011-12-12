# A module for parsing the NFL API
module NFL
    autoload :Download, "#{File.dirname(__FILE__)}/nfl-parser/Download.rb"
    autoload :Parse, "#{File.dirname(__FILE__)}/nfl-parser/Parse.rb"
    autoload :Game, "#{File.dirname(__FILE__)}/nfl-parser/Game.rb"
    autoload :Team, "#{File.dirname(__FILE__)}/nfl-parser/Team.rb"
    autoload :AllWeeks, "#{File.dirname(__FILE__)}/nfl-parser/Week.rb"
    autoload :Week, "#{File.dirname(__FILE__)}/nfl-parser/Week.rb"
    autoload :Schedule, "#{File.dirname(__FILE__)}/nfl-parser/Schedule.rb"
end
