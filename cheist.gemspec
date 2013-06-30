# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cheist/version'

Gem::Specification.new do |spec|
  spec.name          = "cheist"
  spec.version       = Cheist::VERSION
  spec.authors       = ["Josef Šimánek"]
  spec.email         = ["retro@ballgag.cz"]
  spec.description   = %q{HL based server query}
  spec.summary       = %q{basic server queries for A2A servers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
