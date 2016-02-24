class Band < ActiveRecord::Base
  def get_errors
    return @errors
  end

  def set_errors
    @errors = []
    if self.name == ""
      @errors << "Band name cannot be blank"
    end
  end

  def is_valid
    self.set_errors
    if @errors.length > 0
      return false
    else
      return true
    end
  end

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
