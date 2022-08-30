# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tinify/version"

Gem::Specification.new do |spec|
  spec.name          = "tinify"
  spec.version       = Tinify::VERSION
  spec.summary       = "Ruby client for the Tinify API."
  spec.description   = "Ruby client for the Tinify API. Tinify compresses your images intelligently. Read more at https://tinify.com."
  spec.authors       = ["Rolf Timmermans"]
  spec.email         = ["rolftimmermans@voormedia.com"]
  spec.homepage      = "https://tinify.com/developers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]

  spec.add_dependency("httpclient", "~> 2.6")

  spec.add_development_dependency("bundler", "~> 1.7")
  spec.add_development_dependency("rake", "~> 10.0")
  spec.add_development_dependency("minitest", "~> 5.5")

  # TODO: Pinned because `Webmock ~> 1.24` breaks specs. Unpin in future
  #       refactor.
  spec.add_development_dependency("webmock", "~> 1.23.0")
end
