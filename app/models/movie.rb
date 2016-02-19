class Movie < ActiveRecord::Base

  def total_rounds
    (self.movie_upvotes) + (self.movie_downvotes)
  end

  def movie_upvotes
    x = Vote.where({"upvote_id" => self.id})
    x.count
  end

  def movie_downvotes
    x = Vote.where({"downvote_id" => self.id})
    x.count
  end

  def movie_button_1
    x = Vote.where({"vote_button" => self.id})
    x.count
  end

  def movie_button_2
    x = Vote.where({"vote_button" => self.id})
    x.count
  end

end