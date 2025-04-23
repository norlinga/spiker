# frozen_string_literal: true

require_relative "lib/spiker/version"

Gem::Specification.new do |spec|
  spec.name          = "spiker"
  spec.version       = Spiker::VERSION
  spec.authors       = ["Aaron Norling"]
  spec.email         = ["me@aaronware.com"]

  spec.summary       = "Properly spike your Ruby"
  spec.description   = "Scaffold for code spikes, includes simple boilerplate with Minitest + Guard to make red/green work out-of-the-box."
  spec.homepage      = "http://github.com/norlinga/spiker"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/norlinga/spiker"
  spec.metadata["changelog_uri"] = "https://github.com/norlinga/spiker"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.files = Dir["lib/**/*.rb"] + Dir["lib/spiker/templates/**/*"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "thor", "~> 1.3"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
