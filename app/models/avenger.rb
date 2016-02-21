class Avenger < ActiveRecord::Base
  def vote_count
    x = self.id
    y = Showdown.where("winner_id" => x)
    y.count
  end

  def self.rank
    hash = {}
    avengers = Avenger.all
    avengers.each do |a|
      hash[a.name] = a.vote_count
    end
    rankings_hash = hash.sort_by {|key, value| value}.reverse
    rankings_hash
  end

end