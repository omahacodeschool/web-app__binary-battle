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

  #Determines if there are two or more Avengers with the same vote count.
  #
  #Returns Nil if there are no ties
  #
  #Otherwise, returns nested array containing the name and value of the vote count of each tied Avenger.

  def self.find_ties
    tied_heroes = []
    x = Avenger.rank
    a = x.group_by {|k, v| v}
    a.each do |k, v|
      if v.length > 1
        tied_heroes << v
        tied_heroes
      else
        nil
      end 
    end
  end

  #Identifies the names of the Avengers that tied.
  #
  #Returns 
  def tied_hero_names
    if Avenger.find_ties != nil
      first_hero_tied = Avenger.find_ties[0][0]
      second_hero_tied = Avenger.find_ties[0][1]
      hero_1_name = first_hero_tied[0].join
      hero_2_name = second_hero_tied[0].join
    end
  end

  def tie_breaker
    
    @applicable_showdowns = Showdown.where("winner_id" =>)
  end 


end