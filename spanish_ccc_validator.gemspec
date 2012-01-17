# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spanish_ccc_validator/version"

Gem::Specification.new do |s|
  s.name        = "spanish_ccc_validator"
  s.version     = SpanishCccValidator::VERSION
  s.authors     = ["miguel.camba"]
  s.email       = ["miguel.camba@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Spanish Account Number Validator}
  s.description = %q{Provide a simple way to validate spanish ccc numbers}

  s.rubyforge_project = "spanish_ccc_validator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
