class Matchup < ActiveRecord::Base

  def winner_name
    x = self.winner_competitor_id
    y = Competitor.find_by_id(x)
    winner_name = y.name
    return winner_name
  end

  def loser_name
    x = self.loser_competitor_id
    y = Competitor.find_by_id(x)
    loser_name = y.name
    return loser_name
  end

 def get_winner_win_count
    wins = Matchup.where({"winner_competitor_id" => self.winner_competitor_id})
    win_count = wins.count
    return win_count.to_f
  end

  def get_winner_loss_count
    losses = Matchup.where({"loser_competitor_id" => self.winner_competitor_id})
    loss_count = losses.count
    return loss_count.to_f
  end

  def get_winner_win_percent
      win_count = self.get_winner_win_count
      loss_count = self.get_winner_loss_count
      win_percent = (win_count/(win_count + loss_count))
    return win_percent
  end

 def get_loser_win_count
    wins = Matchup.where({"winner_competitor_id" => self.loser_competitor_id})
    win_count = wins.count
    return win_count.to_f
  end

   def get_loser_loss_count
    losses = Matchup.where({"loser_competitor_id" => self.loser_competitor_id})
    loss_count = losses.count
    return loss_count.to_f
  end

  def get_loser_win_percent
      win_count = self.get_loser_win_count
      loss_count = self.get_loser_loss_count
      win_percent = (win_count/(win_count + loss_count))
    return win_percent
  end

   #gets all the matchups with the same combination of competitors
  def get_faceoffs
    faceoffs = Matchup.where({"winner_competitor_id" => [self.winner_competitor_id, self.loser_competitor_id], "loser_competitor_id" => [self.winner_competitor_id, self.loser_competitor_id]})
    return faceoffs
  end

  #get all the matchups where one competitor is the winner
  #get all the matchups where that same competitor is the loser
  # divide the number of matchups where they are the winner by the number of matchups where they appeared at all
  #.sort_by {|key, value| value }

end