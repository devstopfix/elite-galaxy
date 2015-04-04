require 'test/unit'
require 'elite/twist'

class TwistTest < Test::Unit::TestCase

  include Elite::Twist

  def test_rlc8
    assert_equal(0x00, rlc8(0x00))
    assert_equal(0x01, rlc8(0x80))
    assert_equal(0x02, rlc8(0x01))
    assert_equal(0x08, rlc8(0x04))
  end

  def test_twist
    assert_equal(0x0201, twist(0x0180))
    # "0000 0001 1000 0000" -> "0000 0010 0000 0001"
  end

end