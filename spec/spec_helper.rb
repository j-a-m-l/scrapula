if ENV['COVERAGE']
	puts "\n\t > COVERAGE ON"
	require 'simplecov'
end

RSpec.configure do |config|
  config.order = 'random'
end
