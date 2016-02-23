class Nominee < ActiveRecord::Base

  # when attempting to add new category that matches prexisting one
  # RETURNS String containing error mesage 
  def already_exists_error
    return "It appears this nominee might already exist in the database.\r\n
     However, to continue creating the record, please confirm and click 'Add Nominee.'"
  end

  # RETURNS self.image if the value is not an empty string. If string is empty, returns placeholder String
  def get_image_or_placeholder
      return (self.image != "") && (self.image != nil) ? self.image : "http://cdn.browshot.com/static/images/not-found.png"
  end

  
end
