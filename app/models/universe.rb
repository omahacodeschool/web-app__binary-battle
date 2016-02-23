class Universe < ActiveRecord::Base

  ## gets two random, unique characters FROM SPECIFIC UNIVERSE
  # example x,y = characters.get_two
  #(then x and y will be the unique characters)
  #
  # Returns two character objects
  def get_two
    characters = Character.where("universe_id" => self.id)
    characters = characters.shuffle
    @char1 = characters.pop
    @char2 = characters.pop
    return @char1, @char2
  end

  ## CLASS method:
  # gets two random, unique characters FROM ALL UNIVERSES
  # example x,y = Universe.get_two
  #(then x and y will be the unique characters)
  #
  # Returns two character objects

  def self.get_two_battle_royale
    characters = Character.all
    characters = characters.shuffle
    @char1 = characters.pop
    @char2 = characters.pop
    return @char1, @char2
  end
  
end
#DB.define_table("universes")
#DB.define_column("universes","universe_name","string")