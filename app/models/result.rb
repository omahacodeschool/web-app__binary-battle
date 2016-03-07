class Result < ActiveRecord::Base

  #Returns a competitor's name in lieu of their ID
  #
  #Returns a String
  def comp_1_name
    comp = Competitor.find_by_id(self.comp_id_1)
    name = comp.name
    return name
  end

  #Returns a competitor's name in lieu of their ID
  #
  #Returns a String
  def comp_2_name
    comp = Competitor.find_by_id(self.comp_id_2)
    name = comp.name
    return name
  end

  #Returns the winning competitor's name in lieu of their ID
  #
  #Returns a String
  def winner_name
    comp = Competitor.find_by_id(self.winner)
    name = comp.name
    return name
  end

  #Takes an array of wins, sorts by frequency, and returns array in descending #order
  #
  #Returns an Array
  def rankings(counter)
    result = Hash.new(0)
    counter.each {|comp| result[comp] += 1 }
    key_order = Hash[result.sort_by{|k, v| v}.reverse]
    rankings = key_order.keys.each {|key| key}
    return rankings
  end

  #Returns a competitor's name in lieu of their ID
  #
  #Returns a String
  def competitor_name(competitor_id)
    comp = Competitor.find_by_id(competitor_id)
    name = comp.name
    return name
  end

end