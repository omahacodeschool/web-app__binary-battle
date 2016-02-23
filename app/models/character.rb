class Character < ActiveRecord::Base


  def how_many_wins
    x = self.id
    wins = Battle.where({"winner_id" => x})
    if wins == nil
      return 0
    else
      return wins.length
    end
  end

  def how_many_losses
    x = self.id
    losses = Battle.where({"loser_id" => x})
    if losses == nil
      return 0
    else
    return losses.length
    end
  end

  def rank
    #a method to sort an array of characters
    x = self.how_many_wins.to_f
    y = self.how_many_wins.to_f + self.how_many_losses.to_f
      if y == 0
        y = 1
      end
    score = x / y
    return score
  end

  # def break_tie(y)
  #   a = Battle.where("winner_id" => self, "loser_id" => y)
  #   b = Battle.where("winner_id" => y, "loser_id" =>self)
  # end


  def self.find_ties(characterarray)
    characterarray.each_with_index do |character,index|
      character2 = characterarray[index + 1]
      #binding.pry
      if character2 && (character[1] == character2[1])
        character_wins = Battle.where("winner_id" => character, "loser_id" => character2).length
        character2_wins = Battle.where("winner_id" => character2, "loser_id" =>character).length
        if character2_wins > character_wins
          characterarray[i][0] = character2[0]
          characterarray[i + 1] = character[0]
        end
      end
    end
    return characterarray
  end

end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")