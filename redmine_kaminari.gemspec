# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redmine_kaminari/version'

Gem::Specification.new do |spec|
  spec.name          = 'redmine_kaminari'
  spec.version       = RedmineKaminari::VERSION
  spec.authors       = ['Roman Shipiev']
  spec.email         = ['roman@shipiev.pro']
  spec.summary       = %q{Kaminari for Redmine's plugin developers}
  spec.description   = %q{Kaminari pagination is adapted for Redmine. Now "Paginator.new" is in the past!}
  spec.homepage      = 'https://github.com/shipiev/redmine_kaminari'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails',      '~> 4.2'
  spec.add_dependency 'haml-rails', '~> 0.9'
  spec.add_dependency 'kaminari',   '~> 0.16'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 0'
end
