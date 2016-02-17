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

  def how_many_xanders
    x = self.id
    xanders = Xander.where({character_id => x})
    return xanders.length
  end 
end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")