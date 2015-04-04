require 'test/unit'
require 'elite/galaxy'

class GalaxyTest < Test::Unit::TestCase

  def setup
    @galaxy = Elite::Galaxy.new
  end

  def test_galaxy_1
    assert_equal([0x5A4A, 0x0248, 0xB753], @galaxy.seed)
  end

  def test_galaxy_2
    galaxy2 = @galaxy.next_galaxy
    assert_equal([0xB494, 0x0490, 0x6FA6], galaxy2.seed)
  end

  def test_first_planet
    assert_equal("Tibedied", @galaxy.planets.take(1).first)
  end

  def test_eigth_planet_is_lave
    assert_equal("Lave", @galaxy.planets.take(8).last)
  end

end