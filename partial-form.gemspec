# frozen_string_literal: true

require_relative "lib/partial_form/version"

Gem::Specification.new do |spec|
  spec.name = "partial_form"
  spec.version = PartialForm::VERSION
  spec.authors = ["Tom Rothe"]
  spec.email = ["info@tomrothe.de"]

  spec.summary = "TODO: Write a short summary, because RubyGems requires one."
  spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # gemspec = File.basename(__FILE__)
  spec.files = Dir["README.md", "LICENSE.txt", "CHANGELOG.md", "lib/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency("actionview", ">= 7.1")

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
