class Result < ActiveRecord::Base
  def win_name
    x = self.win
    y = Dworf.find_by_id(x)
    return y.name
  end
  def loose_name
    x = self.loose
    y = Dworf.find_by_id(x)
    return y.name
  end
end