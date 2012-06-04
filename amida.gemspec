# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require File.expand_path('../lib/amida/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yuki Ito"]
  gem.email         = ["yuki@gnnk.net"]
  gem.description   = %q{Amida drawing}
  gem.summary       = %q{Amida drawing}
  gem.homepage      = "https://github.com/mururu/amida"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "amida"
  gem.require_paths = ["lib"]
  gem.version       = Amida::VERSION

  gem.add_development_dependency 'rspec', '~> 2.9'
  gem.add_development_dependency 'rake', '~> 0.9.2'
end
