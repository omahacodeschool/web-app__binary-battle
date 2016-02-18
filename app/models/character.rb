class Character < ActiveRecord::Base
  def how_many_wins
    x = self.id
    wins = Battle.where({winner_id => x})
    return wins.length
  end

  def how_many_losses
    x = self.id
    losses = Battle.where({loser_id => x})
    return losses.length
  end

  def self.ranks
    allcharacters = Character.all
    characterhash = Hash.new
      allcharacters.each do |character|
        x = character.how_many_wins
        y = character.how_many_wins + character.how_many_losses
        score = x / y
        characterhash[character.id] = score
      end
    characterarray = characterhash.sorty_by{|k,v|v}
    return characterarray
  end

end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")