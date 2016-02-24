class Dwarf < ActiveRecord::Base
  # Determines if variable holds an empty string
  #
  # Returns a boolean
  def is_valid
    if self.name == ""
      return false
    else
      return true
    end
  end



  # Determines if variable holds data that is already in the database
  #
  # Returns a boolean
  def is_duplicate
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
