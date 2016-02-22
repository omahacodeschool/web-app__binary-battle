class Legend < ActiveRecord::Base

  # def self.random
  #   return Legend.all.sample(2)
  # end

  # finds all of the instances in the Results table
  # where the winner_id equals the legend_id
  # returns an Array
  def wins_arr
    return Result.where("winner_id" => self.id)
  end

  # takes 'wins_arr' and counts the instances when 
  # winner_id is equal to self.id
  #
  # returns an Integer via .length
  def wins_count
    return self.wins_arr.length
  end

  def losses_arr
    return Result.where("loser_id" => self.id)
  end

  def losses_count
    return self.losses_arr.length
  end

  def win_percentage
    return wins_count/(wins_count + losses_count)
  end

  # this method stores the 
  # Legend object 'name' and 'wins'.
  #
  # returns a Hash
  def self.wins_hash
    hash = {}
    all_legends = self.all
    all_legends.each do |l|
      hash[l.name] = l.wins_count
    end
    return hash
  end

  def self.sorted_hash
    hash = Legend.wins_hash
    return hash.sort_by {|name, wins| wins}.reverse
  end

end