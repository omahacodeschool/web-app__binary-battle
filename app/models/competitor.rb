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



  #Gets a hash of competitor id(key) and their win percent(value)

  def winner_with_win_percent
      winner_with_win_percent = {}
      win_count = self.get_win_count
      loss_count = self.get_loss_count
      win_percent = (win_count/(win_count + loss_count))
      winner_with_win_percent[self.id] = win_percent
    return winner_with_win_percent
  end

  # def rank
  #   array_to_sort = []
  #   competitors = Competitor.all
  #   competitors.each do |c|
  #     y = c.winner_with_win_percent
  #     array_to_sort << y
  #   end
  # end




end