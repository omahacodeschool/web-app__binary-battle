class Avenger < ActiveRecord::Base
  def vote_count
    x = self.id
    y = Showdown.all
    y.count(:conditions => "winner_id == x")
  end


end