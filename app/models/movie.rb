class Movie < ActiveRecord::Base

# The count method returns a count of all rows for the model
# The sample method, when given an argument, returns an Array of random elements from the equal to the value of the argument
  def random_movie
    x = Movie.count
    
    
  end
end