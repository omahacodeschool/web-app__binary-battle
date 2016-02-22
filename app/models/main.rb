


class Quarterback < ActiveRecord::Base





  #returns AR Relation of Strings (name of each quarterback object)
  def list_all_quarterbacks
    @quarterbacks = Quarterback.all
    @quarterback_names = []
    @quarterbacks.each do |quarterback|
#something here borrow from swimmer list
    end
  end




  #returns Array of two Strings, the names of two quarterbacks 
  def choose_quarterbacks
    @quarterbacks = Quarterback.all
    @quarterbacks.shuffle
    @quarterbacks.slice[1, 2]
    return @quarterbacks
  end

end