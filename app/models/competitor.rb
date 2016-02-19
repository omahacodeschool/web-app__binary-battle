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

  def rank
    competitors = Competitor.all
    winner_with_win_percent = {}
    competitors.each do |c|
      win_count = c.get_win_count
      loss_count = c.get_loss_count
      win_percent = (win_count/loss_count)
      #store a hash with the competitor object as key and win_percent as value?
      #is wanting to create a hash a good indicator that I should create 
      #another column in my table?
      winner_with_win_percent[c] = win_percent
    end
    return winner_with_win_percent.sort_by {|key, value| value }


  end




end