class Pool < ActiveRecord::Base
    # RETURNS String containing error mesage when attempting to add new category that matches prexisting one
    def get_already_exists_error
      return "That Battle already exists. To add this battle, first close the active instance, or simply edit your preexisting battle if there are not yet any votes for it."
    end

    # RETURNS instance of Nominee row where Pool column matches the Instance's ID.
    def get_nominee_info
      nominee = self.nominee_id
      return Nominee.find_by_id(nominee)
    end

    # RETURNS instance of Category row where Pool column matches the Instance's ID.
    def get_category_info
      category = self.category_id
      return Category.find_by_id(category)
    end

    # def get_selection_ids(x)
    #   arr = []
    #   x.each do |selection|
    #     arr << selection.nominee_id
    #   end
    #   return arr
    # end
  
  end