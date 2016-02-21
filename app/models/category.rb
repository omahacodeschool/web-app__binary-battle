class Category < ActiveRecord::Base

# RETURNS String containing error mesage when attempting to add new category that matches prexisting one
  def get_already_exists_error
    return "That category already exists and is currently active. Rename this activity or
     or edit your preexisting activity"
  end

# RETURNS Collection of pools table rows with category_id columns matching selected category's id.
  def get_pool
    return Pool.where({"category_id" => self.id})
  end
  
end
