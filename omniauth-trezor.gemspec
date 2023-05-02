# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-trezor/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-trezor"
  spec.version       = OmniAuth::Trezor::VERSION
  spec.authors       = ["Jiri Kubicek"]
  spec.email         = ["jiri@kubicek.cz"]

  spec.summary       = "OmniAuth strategy for authenticating against the Trezor Connect"
  spec.description   = "OmniAuth strategy for authenticating against the Trezor Connect"
  spec.homepage      = "https://github.com/kraxnet/omniauth-trezor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 2.0"
  spec.add_dependency "bitcoin", "~> 0.2"
  spec.add_dependency "ffi", "~> 1.9"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sinatra"
end
