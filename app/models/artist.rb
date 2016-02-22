class Artist < ActiveRecord::Base

 def random_artist
  @artist = Artist.all
  @artist.sample(2)
 end

end


