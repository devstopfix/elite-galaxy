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

  def test_last_planet_of_galaxy_8
    galaxy8=@galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy
    assert_equal("Intiso", galaxy8.planets.take(256).last)
  end

  def test_galaxy_9_is_galaxy_1
    galaxy9=@galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy.next_galaxy
    assert_equal(["Tibedied", "Qube"], galaxy9.planets.take(2))
  end

  def test_custom_seed
    @galaxy = Elite::Galaxy.new([0x00d2, 0x669d, 0x0d37])
    assert_equal("Maanlate", @galaxy.planets.take(55).last)
  end

  def test_random_galaxy
    @galaxy = Elite::Galaxy.random_galaxy
    planets = @galaxy.planets.take(256)
    assert_not_equal(planets.first, planets.last)
  end

end