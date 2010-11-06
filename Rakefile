require 'rubygems'
require 'bundler/setup'
if RUBY_VERSION && RUBY_VERSION =~ /1.9/ then
  require 'rspec/core/rake_task'
else
  require 'spec/rake/spectask'
end

task :default => :test
task :test => :spec
task :spec => :environment
if defined?(RSpec)
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/**/*.rb'
    t.rspec_opts = ['-cfs']
elsif defined?(Spec)
  desc "Run all examples" 	
  Spec::Rake::SpecTask.new('spec') do |t|	 	
    t.spec_files = FileList['spec/**/*.rb']	
    t.spec_opts = ['-cfs']
    end
end

namespace :db do
  desc 'Auto-migrate the database (destroys data)'
  task :migrate => :environment do
    DataMapper.auto_migrate!
  end

  desc 'Auto-upgrade the database (preserves data)'
  task :upgrade => :environment do
    DataMapper.auto_upgrade!
  end
end

# Since bundler is being used this is no longer needed but kept if anyone (you zapnap!) wants that instead. :)
namespace :gems do
  desc 'Install required gems'
  task :install do
    required_gems = %w{ sinatra rspec rack-test data_mapper dm-sqlite-adapter haml }
    required_gems.each { |required_gem| system "sudo gem install #{required_gem}" }
  end
end

task :environment do
  require_relative 'environment'
end
