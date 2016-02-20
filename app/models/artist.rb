class Artist < ActiveRecord::Base

  def random_artist
    a = Artist.all
    binding.pry
    @a.order("RAND(:id)").first
    binding.pry
  end

end


