class Result < ActiveRecord::Base

  # defines when 'legends.id' is 'results.winner_id'
  # returns a Hash of 'legends' row data
  def winner
    return Legend.find_by_id(self.winner_id)
  end

  # defines when 'legends.id' is 'results.loser_id'
  # returns a Hash of 'legends' row data
  def loser
    return Legend.find_by_id(self.loser_id)
  end

end