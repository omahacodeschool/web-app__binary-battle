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

    @s1 = Showdown.new
    @s1.choice_one = "Pluto"
    @s1.choice_two = "Copernicus"
    @s1.save

    @s2 = Showdown.new
    @s2.choice_one = "Chicken"
    @s2.choice_two = "Copernicus"
    @s2.save
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

  def test_getting_amounts_of_planets_battles
    assert_equal(@copernicus.get_amount_of_planets_battles, 2)
    assert_equal(@chicken.get_amount_of_planets_battles, 1)
    refute_equal(@copernicus.get_amount_of_planets_battles, 1)
    refute_equal(@chicken.get_amount_of_planets_battles, 2)
  end

  def test_get_all_planets_win_records

  end
end