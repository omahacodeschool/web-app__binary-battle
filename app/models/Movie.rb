class Movie < ActiveRecord::Base

#method takes id, and returns an array containing losses and wins.
  def get_score
  return array eg: [12, 23]
  end

  def get_artwork
    
     return '<img src="http://ia.media-imdb.com/images/M/MV5BMTcwMzU0OTY3NF5BMl5BanBnXkFtZTYwNzkwNjg2._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Eastern Promises">'
  end

end