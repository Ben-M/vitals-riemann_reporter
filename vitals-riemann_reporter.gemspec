# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vitals/riemann_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = "vitals-riemann_reporter"
  spec.version       = Vitals::RiemannReporter::VERSION
  spec.authors       = ["Ben Maraney"]
  spec.email         = ["ben@maraney.com"]

  spec.summary       = %q{A Riemann Reporter for Vitals}
  spec.description   = %q{Send your Vitals metrics to Riemann}
  spec.homepage      = "https://github.com/Ben-M/vitals_riemann-reporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rr", "~> 1.1.2"


  spec.add_runtime_dependency "vitals", ">= 0.9.1"
  spec.add_runtime_dependency "riemann-client", ">= 0.2.6"
end
