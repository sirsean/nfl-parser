require 'rubygems'
require 'rspec/core/rake_task'
require "#{File.dirname(__FILE__)}/lib/nfl-parser/version"

task :default => :spec
RSpec::Core::RakeTask.new(:spec)

desc 'Run all rspec tests with rcov (1.8 only)'
RSpec::Core::RakeTask.new(:rcov) do |t|
	t.rcov_opts =  %q[--exclude "spec,gems"]
	t.rcov = true
end

desc 'Build the gem'
task :gem_build do
	puts `yard`
	puts `gem build nfl-parser.gemspec`
end

desc 'Install gem'
task :gem_install do
	puts `gem install nfl-parser-#{NFL::VERSION}.gem`
end

desc 'Uninstall gem'
task :gem_uninstall do
	puts `gem uninstall nfl-parser`
end

desc 'Build yard documentation'
task :yard do
	puts `yard`
	`open doc/index.html`
end
