# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin-sortable/version'

Gem::Specification.new do |gem|
  gem.name          = "activeadmin-sortable"
  gem.version       = Activeadmin::Sortable::VERSION
  gem.authors       = ["Adam McCrea"]
  gem.email         = ["adam@adamlogic.com"]
  gem.description   = %q{Drag and drop sort interface for ActiveAdmin tables}
  gem.summary       = %q{Drag and drop sort interface for ActiveAdmin tables}
  gem.homepage      = "https://github.com/newcontext/activeadmin-sortable"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activeadmin', '~> 0.4'
end
