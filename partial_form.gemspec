require_relative "lib/partial_form/version"

Gem::Specification.new do |spec|
  spec.name = "partial_form"
  spec.version = PartialForm::VERSION
  spec.authors = ["Tom Rothe"]
  spec.email = ["info@tomrothe.de"]

  spec.summary = "TODO: Write a short summary, because RubyGems requires one."
  spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/motine/partial_form"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/motine/partial_form/"
  spec.metadata["changelog_uri"] = "https://github.com/motine/partial_form/blob/master/CHANGELOG.md"

  spec.files = Dir["README.md", "LICENSE.txt", "CHANGELOG.md", "lib/**/*", "app/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency("actionview", ">= 7.1")
end
