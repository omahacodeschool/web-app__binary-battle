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
      win_count = self.get_win_count
      loss_count = self.get_loss_count
      win_percent = (win_count/(win_count + loss_count))
    return win_percent
  end

  #Gets all opponents that a competitor has faced
  #Investigate shortening this using the Pluck ActiveRecord method
  def get_opponent_ids
    losing_opponents = []
    winning_opponents = []
    # all matchups involving competitor
    faceoff_wins = Matchup.where({"winner_competitor_id" => self.id})
    faceoff_losses = Matchup.where({"loser_competitor_id" => self.id})
    
    # all opponents
      faceoff_wins.each do |m|
        losing_opponents << m.loser_competitor_id
      end

      faceoff_losses.each do |m|
        winning_opponents << m.winner_competitor_id
      end

      all_opponents = losing_opponents + winning_opponents
      opponent_ids = all_opponents.uniq
      return opponent_ids
  end

  #gets an Array of all matchup ids that a competitors opponents have competed #in that 
  #have not involved that competitor

def get_opponents_matchups
  opponent_ids = self.get_opponent_ids
  opponents_matchups = Matchup.where({"winner_competitor_id" => opponent_ids}).where.not({"loser_competitor_id" => self.id})
  opponents_matchups_two = Matchup.where({"loser_competitor_id" => opponent_ids}).where.not({"winner_competitor_id" => self.id})
  opponents_matchups_final = (opponents_matchups + opponents_matchups_two).uniq
  return opponents_matchups_final
end

def get_opponents_matchup_ids
  opponent_ids = self.get_opponent_ids
  opponents_matchup_ids = []
  opponents_matchups = Matchup.where({"winner_competitor_id" => opponent_ids}).where.not({"loser_competitor_id" => self.id})
  opponents_matchups_two = Matchup.where({"loser_competitor_id" => opponent_ids}).where.not({"winner_competitor_id" => self.id})
  opponents_matchups_final = (opponents_matchups + opponents_matchups_two).uniq
  opponents_matchups_final.each do |m|
    opponents_matchup_ids << m.id
  end
  return opponents_matchup_ids
end

#Returns the average win percentage of all a compeitor's opponents in 
#matchups that don't involve that competitor

  def get_opponents_average_win_percentage
    opponents_win_percentages = 0.0
    opponent_ids = self.get_opponent_ids
    opponents_matchup_ids = self.get_opponents_matchup_ids
    opponent_ids.each do |i|
      opponents_win_count = Matchup.where({"id" => opponents_matchup_ids}, {"winner_id" => i}).count.to_f
      opponents_loss_count = Matchup.where({"id" => opponents_matchup_ids}, {"loser_id" => i}).count.to_f
      opponents_win_percent = opponents_win_count/(opponents_win_count + opponents_loss_count)
      opponents_win_percentages += opponents_win_percent
    end
    return opponents_win_percentages/opponent_ids.count
  end

 #Gets the win percent of a competitor's competitors, excluding wins/losses #in matchups with that competitor
    
    # win percent excluding competitor for each of those competitors

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

 #gets an activerecord collection for all the matchups involving one 
 #competitor

 #FIGURE OUT HOW TO GET TWO COLUMN NAMES IN A WHERE QUERY, LIKE .where({
 #"winner_competitor_id" OR "loser_competitor_id"
  def get_competitors_faceoffs
    faceoff_wins = Matchup.where({"winner_competitor_id" => self.id})
    faceoff_losses = Matchup.where({"loser_competitor_id" => self.id})
    faceoffs = faceoff_wins + faceoff_losses
    return faceoffs
  end



end