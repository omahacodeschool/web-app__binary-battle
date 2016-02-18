class Planet < ActiveRecord::Base
  def self.select_two_planets
    @planets = Planet.all
    @array_of_planet_names = []
    @planets.each do |p|
      @array_of_planet_names << p.planet
    end
    @two_planets = @array_of_planet_names.sample(2)
    @first_choice = @two_planets[0]
    @second_choice = @two_planets[1]
    return @two_planets
  end

  def self.display_first_planet
    @two_planets[0]
  end

  def self.display_second_planet
    @two_planets[1]
  end
end