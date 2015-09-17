require_relative './lib/scrapula/version'

Gem::Specification.new do |s|
  s.name        = 'scrapula'
  s.version     = Scrapula::VERSION
  s.summary     = 'Succinctest scraper in the world?'
  s.description = <<-EOF
    Scrapula is a library for scraping web pages that simplifies some of the
    common actions that are involved.

    It has a very simple API that can be used in several ways and contexts, and
    another, shorter, that facilitates processing pages when characters are
    scarce, like irb / pry, or quick and dirty scripts.
  EOF
  s.authors     = ['Juan A. Martín Lucas']
  s.email       = 'scrapula@jaml.site'
  s.homepage    = 'http://github.com/j-a-m-l/scrapula'
  s.license     = 'MIT'

  # TODO
  # s.required_ruby_version
  s.rdoc_options  = ['--charset=UTF-8']

  s.post_install_message = <<-EOF
    Thanks for installing, but keep in mind that this project is not complete!
  EOF

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'mechanize', '~> 2.7', '>= 2.7.3'

  # Development and testing dependencies are listed in the Gemfile.

end
