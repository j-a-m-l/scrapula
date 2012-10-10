require 'rspec/core/rake_task'
require 'cucumber/rake/task'

require './lib/scrapula'
name = 'scrapula'
version = Scrapula::VERSION

task :default => :coverage

desc "Run specs!"
RSpec::Core::RakeTask.new do |t|
	t.rspec_opts = ['--color', '--debug']
	t.pattern = "./spec/**/*_spec.rb"
end

desc "Tasty cucumber"
Cucumber::Rake::Task.new 'features' do |t|
	t.cucumber_opts = "features --format pretty -x"
	t.fork = false
end

desc "Happy coverage"
task :coverage do
	ENV['COVERAGE'] = 'true'
	Rake::Task[:spec].execute
	Rake::Task[:features].execute
end

task :build do
	system "gem build #{name}.gemspec"
end
 
task :install => :build do
	system "gem install #{name}-#{version}"
end
