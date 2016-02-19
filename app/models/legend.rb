class Legend < ActiveRecord::Base

  def self.random
    return Legend.all.sample(2)
  end

end