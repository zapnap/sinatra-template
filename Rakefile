require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'
require 'dotenv/tasks'

task :default => :test
task :test => :spec

if !defined?(RSpec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = Dir['spec/**/*_spec.rb']
  end
end

task :environment => :dotenv do
  require File.join(File.dirname(__FILE__), 'environment')
end

task :console do
  ruby 'script/console'
end
