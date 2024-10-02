require "test_helper"
require "rails/generators/test_case"
require "generators/partial_form/partials_generator"

class GeneratorTest < Rails::Generators::TestCase
  tests PartialForm::Generators::PartialsGenerator
  destination File.expand_path("../tmp/generatortest", __dir__)
  setup :prepare_destination
  teardown { rm_rf(destination_root) }

  def test_generator_copies_all_partials
    run_generator ["all"]
    assert_file("app/views/layouts/form/_label.html.erb", /f\.label/)
    assert_file("app/views/layouts/form/_email_field.html.erb")
  end

  def test_generator_copies_default_partials
    run_generator ["default"]
    assert_file("app/views/layouts/form/_label.html.erb", /f\.label/)
    assert_no_file("app/views/layouts/form/_email_field.html.erb")
  end

  def test_generator_fails_for_invalid_selection
    error_message = capture(:stderr) do
      run_generator ["bad-choice"]
    end
    assert_includes error_message, "choose a valid"
  end
end
