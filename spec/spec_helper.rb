if ENV['COVERAGE']
	puts "\n\t > COVERAGE ON"
	require 'simplecov'
end

require 'vcr'

require_relative '../lib/scrapula'

RSpec.configure do |config|
  config.order = 'random'

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/cassettes'
    config.hook_into :webmock
    config.ignore_localhost = true
    config.allow_http_connections_when_no_cassette = false
    config.default_cassette_options = {
      decode_compressed_response: true,
      record: :new_episodes,
    }
  end

  config.extend VCR::RSpec::Macros

end
