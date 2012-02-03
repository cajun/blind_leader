# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blind_leader/version"

Gem::Specification.new do |s|
  s.name        = "blind_leader"
  s.version     = BlindLeader::VERSION
  s.authors     = ["Zac"]
  s.email       = ["zac@kleinpeter.org"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "blind_leader"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "minitest"
  s.add_development_dependency "turn"
  s.add_development_dependency "rake"
  s.add_development_dependency "cucumber"
  # s.add_runtime_dependency "rest-client"
end
