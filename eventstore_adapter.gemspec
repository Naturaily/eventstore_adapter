$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "eventstore_adapter"
  s.version     = "0.0.1"
  s.authors     = ["John Doe"]
  s.summary     = "EventStore adapter for Ruby"
  s.email       = "john.doe@naturaily.com"
  s.license       = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency("httparty", "~> 0.15")
end
