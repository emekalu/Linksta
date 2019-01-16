# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "linksta/version"

Gem::Specification.new do |spec|
  spec.name          = "linksta"
  spec.version       = Linksta::VERSION
  spec.authors       = ["CAP Testers"]
  spec.email         = ["anthony.kaluuma@bbc.co.uk"]
  spec.summary       = "linksta - The ultimate URL status checker for your website!!"
  spec.description   = "linksta - The ultimate URL status checker for your website!!"
  spec.homepage      = "https://www.test.bbc.co.uk/radio/play/live:radio1"
  spec.license       = "Apache 2"

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "typhoeus"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
