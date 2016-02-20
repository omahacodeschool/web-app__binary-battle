class Planet < ActiveRecord::Base

  #returns Array of Strings (name of each planet object)
  def self.list_planet_names
    @planets = Planet.all
    @array_of_planet_names = []
    @planets.each do |p|
      @array_of_planet_names << p.planet
    end
    return @array_of_planet_names
  end

  #returns Array of two Strings (names of two randomly selected planets)
  def self.select_two_planets
    @array_of_planet_names = Planet.list_planet_names
    @two_planets = @array_of_planet_names.sample(2)
    return @two_planets
  end

end