require "test_helper"

class BuilderTest < Minitest::Test
  def test_version
    assert ::PartialForm.const_defined?(:VERSION)
  end

  # TODO
  def test_something_useful
    assert_equal(1, 1)
  end
end
