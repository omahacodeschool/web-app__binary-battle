class Movie < ActiveRecord::Base

  
  #takes in Movie.all 
  #
  #sorts by wins and breaks all ties
  #
  #returns a Hash of sorted movie names (k) pointing to three values (v,v,v)


  def self.sorted_movies_by_wins
    sorted_hash = {}
    self.all.each do |m|
      #binding.pry
      if m.total_rounds == 0
      else
        sorted_hash.merge! m.movie_name => [m.count_wins, m.count_losses, m.calculate_win_percentage]
      end
    end
    return sorted_hash
  end


  # Finds each Battle where self is the winner, and counts them with a counter.
  #
  #returns an Integer equal to the number of wins.
  def count_wins
      win_no = 0
        Battle.where("movie_winner" => self.id).each do
          win_no += 1 
        end
    return win_no
  end


  # Finds each Battle where self is the loser, and counts them with a counter.
  #
  #returns an Integer equal to the number of losses.
  def count_losses
      loss_no = 0
        Battle.where("movie_loser" => self.id).each do
          loss_no += 1 
        end
    return loss_no
  end


  # Counts total of rounds completed.
  #
  #returns an Integer equal to the number of rounds completed.
  def total_rounds
    self.count_wins + self.count_losses
  end

  def calculate_win_percentage
    x = ((self.count_wins.to_f / self.total_rounds.to_f) * 100).round(2)
  end

end