class Universe < ActiveRecord::Base

  def get_two
    characters = Character.where("universe_id" => self.id)
    characters = characters.shuffle
    @char1 = characters.pop
    @char2 = characters.pop
    return @char1, @char2
  end

  def get_two_battle_royal
    characters = Character.all
    characters = characters.shuffle
    @char1 = characters.pop
    @char2 = characters.pop
    return @char1, @char2
  end

  def character_array
    characters = Character.where("universe_id" => self.id)
    ranks = Hash.new
  
    characters.each do |character|
      x = character.rank
      ranks[character.id] = x
    end
    return ranks.sort{|a1,a2| a2[1]<=>a1[1]}
  end
end
#DB.define_table("universes")
#DB.define_column("universes","universe_name","string")