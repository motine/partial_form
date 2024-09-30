# frozen_string_literal: true

require "test_helper"

class PartialFormBuilderTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::PartialFormBuilder.const_defined?(:VERSION)
    end
  end

  test "something useful" do
    assert_equal(1, 1)
  end
end
