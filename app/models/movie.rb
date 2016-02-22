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
  #Return Float of the
  # def percentage(wins, appearances)
  #   percentage = (wins / appearances) * 100
    
  #   return percentage
  # end

end