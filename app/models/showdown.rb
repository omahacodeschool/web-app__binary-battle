class Showdown < ActiveRecord::Base

  def winner_name  
    x = self.winner_id
    y = Avenger.find_by_id(x)
    y.name
  end

  def get_loser
    if self.hero_1_id != self.winner_id
      self.hero_1_id
    else 
      self.hero_2_id
  end

end
