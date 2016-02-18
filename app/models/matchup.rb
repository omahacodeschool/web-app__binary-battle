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

end