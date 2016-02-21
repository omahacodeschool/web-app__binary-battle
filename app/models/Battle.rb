class Battle < ActiveRecord::Base

  def run_battle

    self.movie_left = rand(1..14)
    self.movie_right = rand(1..14)
    self.save

  end

end
