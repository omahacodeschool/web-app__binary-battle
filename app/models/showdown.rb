class Showdown < ActiveRecord::Base

  def winner_name  
    x = self.winner_id
    y = Avenger.find_by_id(x)
    y.name
  end

  def vote_count
    x = self.
  end

end
