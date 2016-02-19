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

  def test_select_two_planets
    assert_includes(Planet.all, Planet.select_two_planets)
  end
end