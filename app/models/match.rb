class Match < ActiveRecord::Base
      #Return Hash of movies where movie ID's are the keys and number of wins are the values. 
  def Match.count_wins
    x = self.group(:winning_id).count('winning_id')
    sorted = x.sort_by {|key, value| value}.reverse.to_h
    return sorted
  end

  def Match.count_loses
    x = self.group(:losing_id).count('losing_id')
    sorted = x.sort_by {|key, value| value}.reverse.to_h
    return sorted
  end

end