class Battle < ActiveRecord::Base

  def run_battle
    
    self.movie_left = rand(1..14)

    dupe = [self.movie_left]
    self.movie_right = rand(1..14)

    while (dupe.include?(self.movie_right))
      self.movie_right = rand(1..14)  
    end
    
    self.save

  end

end
