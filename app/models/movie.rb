class Movie < ActiveRecord::Base

  def password_check
    if self.params == "password"
      true
    else
      false
    end
  end

  def is_valid
    if self.movie_title == "" || self.movie_poster == ""
      false
    else
      true
    end
  end

  def movie_rank
    x = Hash.new
    self.each do |m|
      x[m.id] = m.movie_win_percent
    end
    movie_sorted_rank_arr = x.sort_by(&:last).reverse
  end
  
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

  def movie_win_percent
    ((self.movie_upvotes.to_f / self.total_rounds.to_f) * 100).round(2)
  end

  def movie_loss_percent
    ((self.movie_downvotes.to_f / self.total_rounds.to_f) * 100).round(2)
  end

  def movie_button_1_up
    x = Vote.where({"vote_button" => 1})
    y = x.where({"upvote_id" => self.id})
    y.count
  end

  def movie_button_2_up
    x = Vote.where({"vote_button" => 2})
    y = x.where({"upvote_id" => self.id})
    y.count
  end

  def movie_button_1_down
    x = Vote.where({"vote_button" => 1})
    y = x.where({"downvote_id" => self.id})
    y.count
  end

  def movie_button_2_down
    x = Vote.where({"vote_button" => 2})
    y = x.where({"downvote_id" => self.id})
    y.count
  end

end