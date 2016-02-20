class Showdown < ActiveRecord::Base

  def winner_name  
    x = self.winner_id
    y = Avenger.find_by_id(x)
    y.name
  end

  def vote_count
    x = Avenger.where("id" => self.winner_id)
    x.winner_id.count
  end

end
