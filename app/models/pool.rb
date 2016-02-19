class Pool < ActiveRecord::Base
  has_many :ids, through: :nominee_ids

  # RETURNS String containing error mesage when attempting to add new category that matches prexisting one
  def get_already_exists_error
    return "That Battle already exists. To add this battle, first close the active instance, or simply edit your preexisting battle if there are not yet any votes for it."
  end
end