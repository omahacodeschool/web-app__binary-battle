class Band < ActiveRecord::Base
  def votes
    votes = Result.where("winner_id" => self.id)
    return votes.length
  end

  def self.band_ranks
    sorted_bands = {}
    Band.all.each do |b|
      sorted_bands[b.name] = b.votes
    end
    return sorted_bands.sort_by {|_key, value| value}.reverse.to_h
  end
end
