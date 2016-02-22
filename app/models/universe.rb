class Universe < ActiveRecord::Base

  def get_two
    characters = Character.where("universe_id" => self.id)
    characters = characters.shuffle
    @char1 = characters.pop
    @char2 = characters.pop
    return @char1, @char2
  end
end
#DB.define_table("universes")
#DB.define_column("universes","universe_name","string")