class Legend < ActiveRecord::Base

  # def self.random
  #   return Legend.all.sample(2)
  # end

  # defines where 'results.winner_id' is 'legends.id'
  # returns an Array of objects
  def wins_arr
    return Result.where("winner_id" => self.id)
  end

  # defines the length of 'wins_arr'
  # returns an Integer
  def wins_count
    return self.wins_arr.length
  end

  # defines where 'results.loser_id' is 'legends.id'
  # returns an Array of objects
  def losses_arr
    return Result.where("loser_id" => self.id)
  end

  # defines the length of 'losses_arr'
  # returns an Integer
  def losses_count
    return self.losses_arr.length
  end

  # defines an individual legend's win%
  # returns a Floate
  def win_percentage
    return wins_count.to_f/(wins_count.to_f+ losses_count.to_f)
  end

  # defines win counts for each legend
  # returns a Hash sorted by 'wins' and subsequently reversed.
  def self.wins_hash
    hash = {}
    all_legends = self.all
    all_legends.each do |l|
      hash[l.name] = l.wins_count
    end
    return hash.sort_by {|name, wins| wins}.reverse
  end

  # defines win percentages for each legend
  # returns a Hash sorted by 'win_percentage' and reversed
  def self.win_percentage_hash
    hash = {}
    all_legends = self.all
    all_legends.each do |l|
      hash[l.name] = l.win_percentage
    end
    return hash.sort_by {|name, wp| wp}.reverse
  end

end