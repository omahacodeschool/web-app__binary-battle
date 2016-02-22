class Result < ActiveRecord::Base

  # defines row information for 'winner'
  # returns a Hash where 'results.winner_id' is 'legends.id'
  def winner
    return Legend.find_by_id(self.winner_id)
  end

  def loser
    return Legend.find_by_id(self.loser_id)
  end



end