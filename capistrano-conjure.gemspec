# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/conjure/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-conjure"
  spec.version       = Capistrano::Conjure::VERSION
  spec.authors       = ["Brian Auton"]
  spec.email         = ["brianauton@gmail.com"]
  spec.summary       = "Conjure provisioning support for Capistrano 3.x"
  spec.homepage      = "https://github.com/brianauton/capistrano-conjure"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
  spec.add_dependency "capistrano", "~> 3.0"
  spec.add_dependency "conjure", "~> 0.3"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
end
