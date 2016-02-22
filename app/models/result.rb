 class Result < ActiveRecord::Base
  def winner_name
    x = self.winner_id
    y = Band.find_by_id(x)
    return y.name
  end
  def loser_name
    x = self.loser_id
    y = Band.find_by_id(x)
    return y.name
  end
end