class Dwarf < ActiveRecord::Base
  
  # Returns a boolean
  def is_valid
    if self.name == ""
      return false
    else
      return true
    end
  end




  # Returns a boolean
  def is_duplicate
    duplicate = false
    @all_dwarves = Dwarf.all

      @all_dwarves.each do |dwarf|

        if self.name == dwarf.name
          return true
        else
          return false
        end
      end
  end





end
