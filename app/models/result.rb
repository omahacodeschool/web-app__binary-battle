class Result < ActiveRecord::Base

  def winner
    return Legend.find_by_id(self.winner_id)
  end

  def loser
    return Legend.find_by_id(self.loser_id)
  end

end