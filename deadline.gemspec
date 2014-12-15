require File.expand_path('../lib/deadline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'deadline'
  gem.version       = Deadline::VERSION
  gem.summary       = %q{Simple deadline tracker.}
  gem.description   = %q{
    Keep track of a deadline.
  }
  gem.license       = 'GPLv2'
  gem.authors       = ['Luca Molari']
  gem.email         = 'molari.luca@gmail.com'
  gem.homepage      = 'https://github.com/LMolr/deadline'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler',    '~> 1.7'
  gem.add_development_dependency 'rake',       '~> 10.3'
  gem.add_development_dependency 'yard',       '~> 0.8'
  gem.add_development_dependency 'rspec',      '~> 3.1'
  gem.add_development_dependency 'pry',        '~> 0.10'
  gem.add_development_dependency 'pry-byebug', '~> 2.0'

end