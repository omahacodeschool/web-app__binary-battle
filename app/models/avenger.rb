class Avenger < ActiveRecord::Base

  def vote_count
    x = self.id
    y = Showdown.where("winner_id" => x)
    y.count
  end

  def self.rank(attribute)
    hash = {}
    avengers = Avenger.all
    avengers.each do |a|
      hash[a.attributes[attribute]] = a.vote_count
    end
    rankings_hash = hash.sort_by {|key, value| value}.reverse
    rankings_hash
  end


  #Determines if there are two or more Avengers with the same vote count.
  #
  #Returns Nil if there are no ties
  #
  #Otherwise, returns nested array containing the name and value of the vote count of each tied Avenger.

  def self.find_ties

    tied_heroes = []
    x = Avenger.rank("id")
    a = x.group_by {|k, v| v}
    a.each do |k, v|
      if v.length > 1
        tied_heroes << v
      end       
    end
    tied_heroes
        
  end

  def self.find_ties?
    if Avenger.find_ties == []
      false
    else
      true
    end
  end

  #Identifies the names of the Avengers that tied.
  #
  #
  def self.tie_breaker
    tied_heroes = Avenger.find_ties
    #Example tied_heroes: 
    #[
    # => [
    # =>      ["Thor", 9],
    # =>      ["Iron Man", 9],
    # =>      ["Hawkeye", 9]
    # => ], 
    # => [
    # =>      ["Hulk", 6], 
    # =>      ["Black Widow", 6]  
    # =>]
    #] 
    # 

        #Example data: ["Thor", 9]
    #***Note: All names are actually id's, using names for sanity's sake.
    tied_ids_array = []
    tied_groups = tied_heroes[0]
    tied_groups.each do |tied_element|
      hero_name = tied_element[0]
      tied_ids_array << hero_name

    end
    tied_ids_array
  end 


end