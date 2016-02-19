class Category < ActiveRecord::Base

# RETURNS String containing error mesage when attempting to add new category that matches prexisting one
  def get_already_exists_error
    return "That category already exists and is currently active. Rename this activity or
     or edit your preexisting activity"
  end

  
end
