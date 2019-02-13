# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mws/feeds/version"

Gem::Specification.new do |spec|
  spec.name          = "mws-feeds"
  spec.version       = Mws::Feeds::VERSION
  spec.authors       = ["Robin Daugherty"]
  spec.email         = ["robin@robindaugherty.net"]

  spec.summary       = %q{Wraps the Amazon MWS Feeds API}
  spec.description   = %q{A rich Ruby interface to the Amazon MWS Feeds API.}
  spec.homepage      = 'https://github.com/Flowspace-Team/mws-feeds'
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = 'https://github.com/Flowspace-Team/mws-feeds'
    spec.metadata["changelog_uri"] = 'https://github.com/Flowspace-Team/mws-feeds/releases'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'money', '~> 6.0'
  spec.add_runtime_dependency 'nokogiri', '~> 1.5'
  spec.add_runtime_dependency 'peddler', '~> 2.0'
  spec.add_runtime_dependency 'structure', '~> 1.0'

  spec.required_ruby_version = '>= 2.3'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'pry'
end
