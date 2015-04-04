require 'test/unit'
require 'elite/fib'

class FibTest < Test::Unit::TestCase

  include Elite::Fib

  def test_int
    assert_equal(1, int_16_bits(65537))
  end

  def test_simple_fib
    assert_equal([3, 5, 8], next_fib_triple([0, 3, 5]))
  end

end