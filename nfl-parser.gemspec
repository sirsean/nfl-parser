$:.push File.expand_path("../lib", __FILE__)
require "nfl-parser/version"

spec = Gem::Specification.new do |s|
  s.name = 'nfl-parser'
  s.version = NflParser::VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.summary = "Parse the NFL API"
  s.description = 'A module that allows you to parse the JSON provided by the NFL API'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'syntax'
  s.author = "Sean Schulte"
  s.email = "sirsean@gmail.com"
  s.homepage = "http://vikinghammer.com"
  s.required_ruby_version = ">= 1.8.7"
  s.files = %w(README.md Rakefile) + Dir["{lib,script,spec,doc}/**/*"]
  s.test_files= Dir.glob('test/*_spec.rb')
  s.require_path = "lib"
end

