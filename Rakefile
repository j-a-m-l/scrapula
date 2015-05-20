require 'rspec/core/rake_task'

require './lib/scrapula/version'
name = 'scrapula'
version = Scrapula::VERSION

task :default => :coverage

desc "Run specs!"
RSpec::Core::RakeTask.new do |t|
	t.rspec_opts = ['--color', '--debug']
	t.pattern = "./spec/**/*_spec.rb"
end

# Alias
task :test => :spec

desc "Happy coverage"
task :coverage do
	ENV['COVERAGE'] = 'true'
	Rake::Task[:spec].execute
end

task :build do
	system "gem build #{name}.gemspec"
end
 
task :install => :build do
	system "gem install #{name}-#{version}"
end
