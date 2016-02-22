class Band < ActiveRecord::Base
  def votes
    votes = Result.where("winner_id" => self.id)
    return votes.length
  end
end
