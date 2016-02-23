require 'test_helper'

class PlanetTest < Minitest::Test
  def setup
    super

    @jupiter = Planet.new
    @jupiter.planet = "Jupiter"
    @jupiter.points = 4
    @jupiter.win_record = @jupiter.points/8
    @jupiter.save

    @saturn = Planet.new
    @saturn.planet = "Saturn"
    @saturn.points = 2
    @saturn.win_record = @saturn.points/4
    @saturn.save

    @chicken = Planet.new
    @chicken.planet = "Chicken"
    @chicken.points = 4
    @chicken.win_record = @chicken.points/8
    @chicken.save

    @copernicus = Planet.new
    @copernicus.planet = "Copernicus"
    @copernicus.points = 2
    @copernicus.win_record = @copernicus.points/2
    @copernicus.save

    @pluto = Planet.new
    @pluto.planet = "Pluto"
    @pluto.points = 4
    @pluto.win_record = @pluto.points/8
    @pluto.save

    @s1 = Showdown.new
    @s1.choice_one = "Pluto"
    @s1.choice_two = "Copernicus"
    @s1.winner = "Copernicus"
    @s1.save

    @s2 = Showdown.new
    @s2.choice_one = "Chicken"
    @s2.choice_two = "Copernicus"
    @s2.winner = "Copernicus"
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
    @planets = Planet.all
    @planets.get_all_planets_win_records
    assert_equal(@pluto.win_record, 0.0)
    assert_equal(@copernicus.win_record, 1.0)
  end
end