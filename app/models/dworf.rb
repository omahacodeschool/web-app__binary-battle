class Dworf < ActiveRecord::Base
  def vote
    x = self.vote
    y = 1
    return x + y
  end
end