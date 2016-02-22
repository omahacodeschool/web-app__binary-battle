class Movie < ActiveRecord::Base

  def find_winning_percentage
    movie_id = self.id
    x = Result.where({winning_id => movie_id})
  end
  #Returns Integer of the number of times the movie has won overall.
  def count_wins
    movie_id = self.id
    x = Count.where({"winning_id" => movie_id})
    wins = x.group(:winning_id).count('winning_id')
    return wins.values[0]
  end
    #Return Integer of the number of times a movie has apeared overall.
  def count_appearances
    movie_id = self.id
    x = Count.where({"winning_id" => movie_id})
    wins = x.group(:winning_id).count('winning_id')
    y = Count.where({"losing_id" => movie_id})
    loses = y.group(:losing_id).count('losing_id')
    appearances = wins.values[0] + loses.values[0]
    return appearances
  end
  #Find the win percentage of opponent without the competitor in question.

  #Need to pass in a Relation for individual opponent who's win percentage is being calculated. Because this method I think would be used while itterating through a movie object.

  #Return Float of the win percentage for the opponent for the times that they did not compete against the competitor in question.
  def opponents_win_percentage(opponent)
    movie_id = self.id
    x = Count.where({"winning_id" => movie_id}).where.not({"losing_id" => opponent.id})
    wins = x.group(:winning_id).count('winning_id')
    y = Count.where({"losing_id" => movie_id}).where.not({"winning_id" => opponent.id})
    loses = y.group(:losing_id).count('losing_id')
    appearances = wins.values[0] + loses.values[0]
    average = wins.values[0].to_f / appearances.to_f
    return average 
  end

end