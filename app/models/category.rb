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

  def results_frequency_for_each_nominee
    category_id = self.id
    results = Result.where({"category_id" => category_id})
    nominee_hash = Hash.new(0)
    results.each do |winner| 
      winner = winner.loved_id
      if winner != nil
        nominee_hash[winner] +=1
      end
    end
    tallied_results = nominee_hash.sort_by{ |key, value| value}.reverse.to_h
    return tallied_results
  end

  def results_frequency_for_each_combination
    category_id = self.id
    results = Result.where({"category_id" => category_id})
    result_hash = Hash.new(0)
    count = 0
    results.each do |combo| 
      winner = combo.loved_id
      loser = combo.lost_id
      if winner != nil && loser != nil
        result_hash[winner.to_s + "-" + loser.to_s] += 1
      end
    end
    return result_hash
  end
end
