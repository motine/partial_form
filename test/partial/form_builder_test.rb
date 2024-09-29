# frozen_string_literal: true

require "test_helper"

class Partial::FormBuilderTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Partial::FormBuilder.const_defined?(:VERSION)
    end
  end

  test "something useful" do
    assert_equal(1, 1)
  end
end
