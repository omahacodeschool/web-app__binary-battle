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
  def Count.winning_movie
    x = self.group(:winner_id).count('winner_id')
    sorted = x.sort_by {|key, value| value}.reverse.to_h
    return sorted
  end

end