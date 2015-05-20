if ENV['COVERAGE']
	puts "\n\t > COVERAGE ON"
	require 'simplecov'
end

require_relative '../lib/scrapula'

RSpec.configure do |config|
  config.order = 'random'
end
