class Count < ActiveRecord::Base
  #Return String of movies name
  def first_movie_name
    x = self.movie1_id
    y = Movie.find_by_id(x)
    return y.movie_name
  end
  #Return String of second movie's name
  def second_movie_name
    x = self.movie2_id
    y = Movie.find_by_id(x)
    return y.movie_name
  end
  #Return String of winning movie's name
  def winning_movie_name
    x = self.winner_id
    y = Movie.find_by_id(x)
    return y.movie_name
  end
    #Return Relation of movies in decending order based on their win counts.
  def Count.count_wins
    x = self.group(:winning_id).count('winning_id')
    sorted = x.sort_by {|key, value| value}.reverse.to_h
    return sorted
  end

  def Count.count_loses
    x = self.group(:losing_id).count('losing_id')
    return x
  end

  #Check for ties.
  #Call on a hash that is the result of Count.winning_movie 
  #Return True if 2 movies have the same number of wins, else return False.

end
   