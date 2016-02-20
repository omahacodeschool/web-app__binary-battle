class Count < ActiveRecord::Base
  #Return String of movies name
  def first_movie_name
    x = self.movie1_id
    y = Movie.find_by_id(x)
    return y.movie_name
  end
    def second_movie_name
    x = self.movie2_id
    y = Movie.find_by_id(x)
    return y.movie_name
  end
end