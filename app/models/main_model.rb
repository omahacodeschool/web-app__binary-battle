class Planet < ActiveRecord::Base
  def self.select_two_planets
    @planets = Planet.all
    @array_of_planet_names = []
    @planets.each do |p|
      @array_of_planet_names << p.planet
    end
    @two_planets = @array_of_planet_names.sample(2)
    return @two_planets
  end

  def first_planet_choice
    @two_planets[0]
  end

  def second_planet_choice
    @two_planets[1]
  end
end