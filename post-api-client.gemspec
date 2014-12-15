# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'post/api/client/version'

Gem::Specification.new do |spec|
  spec.name          = "post-api-client"
  spec.version       = Post::Api::Client::VERSION
  spec.authors       = ["Joe Connor"]
  spec.email         = ["joe.connor@factorymedia.com"]
  spec.description   = %q{Client to communicate with po.st URL shortener service}
  spec.summary       = %q{Client to communicate with po.st URL shortener service}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-rcov"
  spec.add_development_dependency "psych"


  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "activesupport"

end
