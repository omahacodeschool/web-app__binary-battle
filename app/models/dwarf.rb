class Dwarf < ActiveRecord::Base
  
  # Returns a boolean
  def is_valid
    if self.name == ""
      return false
    else
      return true
    end
  end

end