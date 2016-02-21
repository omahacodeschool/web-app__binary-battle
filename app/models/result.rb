 class Result < ActiveRecord::Base
  # Finds instances of winner_id = self
  #
  # Returns Array
  def wins
    x = Result.where("winner_id" => self.id)
    return x
  end
end 
