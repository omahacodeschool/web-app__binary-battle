class Nominee < ActiveRecord::Base

  # when attempting to add new category that matches prexisting one
  # RETURNS String containing error mesage 
  def already_exists_error
    return "It appears this nominee might already exist in the database.\r\n
     However, to continue creating the record, please confirm and click 'Add Nominee.'"
  end

end