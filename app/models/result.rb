class Result < ActiveRecord::Base

  def comp_1_name
    comp = Competitor.find_by_id(self.comp_id_1)
    name = comp.name
    return name
  end

  def comp_2_name
    comp = Competitor.find_by_id(self.comp_id_2)
    name = comp.name
    return name
  end

  def winner_name
    comp = Competitor.find_by_id(self.winner)
    name = comp.name
    return name
  end

  def rankings(counter)
    result = Hash.new(0)
    counter.each {|comp| result[comp] += 1 }
    key_order = Hash[result.sort_by{|k, v| v}.reverse]
    rankings = key_order.keys.each {|key| key}
    return rankings
  end

  def competitor_name(competitor_id)
    comp = Competitor.find_by_id(competitor_id)
    name = comp.name
    return name
  end

end