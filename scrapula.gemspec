require './lib/scrapula'

Gem::Specification.new do |s|
  s.name = 'scrapula'
  s.version = Scrapula::VERSION
  s.authors = ["Juan Antonio Martín Lucas"]
  s.description = 'One of the simplest crawler in the world'
  s.summary = "scrapula-#{s.version}"
  s.email = 'scrapula@noijd.com'
  s.homepage = 'http://github.com/noijd/scrapula'

  # TODO
  # s.add_runtime_dependency 'cucumber', '>= 1.1.1'
  # s.add_runtime_dependency 'childprocess', '>= 0.2.3'
  # s.add_runtime_dependency 'ffi', '>= 1.0.11'
  # s.add_runtime_dependency 'rspec', '>= 2.7.0'
  # s.add_development_dependency 'bcat', '>= 0.6.1'
  # s.add_development_dependency 'rdiscount', '>= 1.6.8'
  # s.add_development_dependency 'rake', '>= 0.9.2'

  # TODO check
  s.rubygems_version = ">= 1.6.1"
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path = "lib"
	s.rdoc_options = ["--charset=UTF-8"]
end
