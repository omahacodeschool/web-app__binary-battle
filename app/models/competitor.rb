class Competitor < ActiveRecord::Base

  #Gets the number of times a single competitor has won
  #Returns a float of wins

  def get_win_count
    wins = Matchup.where({"winner_competitor_id" => self.id})
    win_count = wins.count
    return win_count.to_f
  end

  #Gets the number of times a single competitor has lost
  #Returns a float of losses

  def get_loss_count
    losses = Matchup.where({"loser_competitor_id" => self.id})
    loss_count = losses.count
    return loss_count.to_f
  end


  #Gets the win percent of a competitor

  def win_percent
      winner_with_win_percent = {}
      win_count = self.get_win_count
      loss_count = self.get_loss_count
      win_percent = (win_count/(win_count + loss_count))
      #winner_with_win_percent[self.id] = win_percent
    return win_percent
  end

# This is a method I can call on the Competitor class to get a hash of #competitor ids and win percents. Add a feature to pass in an argument for the #category later

  def self.rank
    hash = {}
    competitors = Competitor.all
      competitors.each do |c|
      hash[c.name] = c.win_percent
      end
    rankings_hash = hash.sort_by {|key, value| value }.reverse
    return rankings_hash
  end



end