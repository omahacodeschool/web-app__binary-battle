class Legend < ActiveRecord::Base

  def self.random
    return Legend.all.sample(2)
  end

  # finds all of the instances in the Results table where the winner_id equals the legend_id
  # returns an Array
  def wins_arr
    return Result.where("winner_id" => self.id)
  end

  # takes 'wins_arr' Array and counts the instances of winner_id equal to self.id via .length method
  # returns an Integer
  def wins
    return self.wins_arr.length
  end

end