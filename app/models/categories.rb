class Category < ActiveRecord::Base

# RETURNS String containing error mesage.
  def get_category_already_exists_error
    return "That category already exists and is currently active. Please add a different activity
     or edit your preexisting activity"
  end

  
end
