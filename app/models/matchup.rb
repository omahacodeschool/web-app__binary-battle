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



  #get all the matchups where one competitor is the winner
  #get all the matchups where that same competitor is the loser
  # divide the number of matchups where they are the winner by the number of matchups where they appeared at all
  #.sort_by {|key, value| value }

end