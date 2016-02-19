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
end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")