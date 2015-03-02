# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_responsible/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_responsible"
  spec.version       = ActsResponsible::VERSION
  spec.authors       = ["Daniel Lichty"]
  spec.email         = ["dan@lichty.ca"]
  spec.summary       = %q{JSON API-(jsonapi.org)-compliant rendering of RABL templates}
  spec.description   = %q{Use your own models' custom RABL templates and render JSON responses that follow the structure set out by JSON API (jsonapi.org).}
  spec.homepage      = 'http://rubygems.org/gems/acts_responsible'
  spec.license       = "MIT"

  spec.files         = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.4"
end
