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

  # defines each legend's list of results
  # returns an Array
  def head_to_head(legend_1, legend_2)

  end

  def tiebreaker(legend_1_wins, legend_2_wins)
    if legend_1_wins > legend_2_wins
      return legend_1_wins_tiebreaker
    elsif legend_2_wins > legend_1_wins
      return legend_2_wins_tiebreaker
    else
      return draw
    end 
  end


end