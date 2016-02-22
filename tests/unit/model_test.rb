require 'test_helper'

class PlanetTest < Minitest::Test
  def setup
    super

    @jupiter = Planet.new
    @jupiter.planet = "Jupiter"
    @jupiter.save

    @saturn = Planet.new
    @saturn.planet = "Saturn"
    @saturn.save

    @chicken = Planet.new
    @chicken.planet = "Chicken"
    @chicken.save

    @copernicus = Planet.new
    @copernicus.planet = "Copernicus"
    @copernicus.save

    @pluto = Planet.new
    @pluto.planet = "Pluto"
    @pluto.save
  end

  def test_list_planet_names
    assert_includes(Planet.list_planet_names, "Copernicus")
    assert_includes(Planet.list_planet_names, "Saturn")
    assert_includes(Planet.list_planet_names, "Jupiter")
  end

  def test_select_two_planets
    assert_includes(Planet.list_planet_names, Planet.select_two_planets[0])
    assert_includes(Planet.list_planet_names, Planet.select_two_planets[1])
  end

end