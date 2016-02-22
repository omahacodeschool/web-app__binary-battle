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

  # defines each time 2 legends faced off
  # returns an Array
  def matchups(@legend_1, @legend_2)
    @legend = 
    self.where("@legend_1.winner_id" = Legend.id) && 
  end


  # defines who wins a tiebreaker
  # returns a String  
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