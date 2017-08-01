# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "eventstore_adapter"
  s.version     = "0.0.1"
  s.authors     = ["Marcin Mantke"]
  s.summary     = "EventStore adapter for Ruby"
  s.email       = "marcin.mantke@naturaily.com"
  s.license       = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.1.0"

  s.add_dependency("httparty", "~> 0.15")
  s.add_dependency("uuid", "~> 2.3")
  s.add_dependency("feedjira", "~> 2.1")
end
