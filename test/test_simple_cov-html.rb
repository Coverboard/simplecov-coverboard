require "helper"

class TestSimpleCovCoverBoard < Test::Unit::TestCase
  def test_defined
    assert defined?(SimpleCov::Formatter::CoverBoardFormatter)
    assert defined?(SimpleCov::Formatter::CoverBoardFormatter::VERSION)
  end
end
