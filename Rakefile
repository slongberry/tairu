$:.unshift File.expand_path('../lib', __FILE__)
require 'tairu/version'

task :build do
  system 'gem build tairu.gemspec'
end

task :release => :build do
  system "gem push tairu-#{Tairu::VERSION}.gem"
end

task :console do
  ARGV.clear
  require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'tairu'))
  require 'irb'
  IRB.start
end

require 'rspec/core/rake_task'
task :default => :spec
RSpec::Core::RakeTask.new
