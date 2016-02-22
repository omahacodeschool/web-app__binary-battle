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

  #returns Integer (amount of times a planet has appeared in battles thus far)
  def get_amount_of_planets_battles
    @this_planet = Planet.find_by_id(self.id)
    @planet_name = @this_planet.planet
    @choice_one_occurrences = Showdown.where({"choice_one" => @planet_name})
    @choice_two_occurrences = Showdown.where({"choice_two" => @planet_name})
    @choice_one_array = []
    @choice_two_array = []
    @choice_one_occurrences.each do |i|
      @choice_one_array << i.id
    end
    @choice_two_occurrences.each do |i|
      @choice_two_array << i.id
    end
    @freq_choice_one = @choice_one_array.length.to_f
    @freq_choice_two = @choice_two_array.length.to_f
    @planet_frequency = @freq_choice_one + @freq_choice_two
    return @planet_frequency
  end

  def self.get_all_planets_win_records
    @planets.each do |p|
      @past_battles = p.get_amount_of_planets_battles
      @rounded = (p.points.to_f / @past_battles).round(3)
      p.win_record = @rounded
      p.save
    end
  end
end