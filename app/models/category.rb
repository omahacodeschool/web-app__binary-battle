class Category < ActiveRecord::Base

  # RETURNS String containing error mesage when attempting to add new category that matches prexisting one
  def get_already_exists_error
    return "That category already exists and is currently active. Rename this activity or
     or edit your preexisting activity"
  end

  # RETURNS String containing error message for fewer than two nominees in a category
  def not_enough_nominees_error
    category = self.id
    category = "This category does not have enough nominees to vote on. Please add more."
    return category
  end

  def get_pool_nominees_array
    nominee_arr = []
    pool = Pool.where({"category_id" => self.id})
    pool.each do |pool|
      nominee = pool.nominee_id
      nominee_arr << nominee
    end
    return nominee_arr
  end

 
  # RETURNS Collection of pools table rows with category_id columns matching selected category's id.
  def get_pool
    return Pool.where({"category_id" => self.id})
  end

  def check_pool_size
    category = Pool.where({"category_id" => self.id})
    return category.length <= 1 ? true : false
  end

  def get_sample
    category = self.id
    return Pool.where({"category_id" => category}).sample(2)
  end
      


  # RETURNS row Instance's image url as a String OR returns placeholder string if self.image is an empty string.
  def get_image_or_placeholder
      return (self.image != "") && (self.image != nil) ? self.image : "http://cdn.browshot.com/static/images/not-found.png"
  end

 def check_image_exists
      return (self.image != "") && (self.image != nil) ? true : false
  end

  #Gets Hash Array of Result table loved_ids. The value is the frequency of times it appears in the Collection
  #
  # results: Data Collection based on specified category_id parameters. 
  # nominee_hash = empty hash - base value set to 0 for each new key added. Will store the algorithmic results.
  # taillied results = the Hash array generated when sorting nominee_hash array by highest value


  # Returns tallied_results Hash Array of hash[winning nominee id] = number of times they won. sorted by value - DESC order
  def winning_results_frequency_for_each_nominee
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


  #Gets Hash Array of Result table lost_ids. The value is the frequency of times it appears in the scoped Result Collection
  #
  # results: Data Collection based on specified category_id parameters. 
  # nominee_hash = empty hash - base value set to 0 for each new key added. Will store the algorithmic results.
  # taillied results = the Hash array generated when sorting nominee_hash array by highest value


  # Returns tallied_results Hash Array of hash[winning nominee id] = number of times they lost. sorted by value - DESC order
  def losing_results_frequency_for_each_nominee
    category_id = self.id
    results = Result.where({"category_id" => category_id})
    nominee_hash = Hash.new(0)

    results.each do |loser| 
      loser = loser.lost_id
      if loser != nil
        nominee_hash[loser] +=1
      end
    end
    tallied_results = nominee_hash.sort_by{ |key, value| value}.reverse.to_h
    return tallied_results
  end



  #Creates Array of keys from Hash Array created in winning_results_frequency_for_each_nominee
  #
  # winning_count: Variable that calls winning_results_frequency_for_each_nominee and sets Variable value equal to the returned data.
  # nominee_hash = Variable. Value is initially an empty array. Each key from winning_count Variable is eventually passed into it.
  #
  # RETURNS winning_arr Array containing keys from winning_count Variable
  def get_wins_results_array_frequency_for_each_nominee
    winning_count = winning_results_frequency_for_each_nominee
    winning_arr = []

    winning_count.each do |key, value|
      winning_arr << key
    end 

    return winning_arr
  end



  #Checks to see if a key in losing_count Hash Collection does not exist in winning_arr Array, Passes key into no_wins_arr Array if it does not exist
  #
  # losing_count: Variable. value is set to Hash Collection value returned in losing_results_frequency_for_each_nominee Method.
  # winning_arr: Variable. value is set to Array generated from get_wins_results_array_frequency_for_each_nominee method
  # no_wins_arr: Variable. value is an array of losing_count keys that do not exist in no_wins_arr Array.
  #
  # RETURNS no_wins_arr Array 
  def checking_for_no_wins_results_frequency_for_each_nominee
    losing_count = losing_results_frequency_for_each_nominee
    winning_arr = get_wins_results_array_frequency_for_each_nominee
    no_wins_arr = []

    losing_count.each do |key, value|
      if winning_arr.include?(key) == false
        no_wins_arr << key
      end
    end

    return no_wins_arr
  end


  #Creates new key/value pairs in winning_count for each element in no_wins_arr Array. Sets element as Key and value as 0.
  #
  # winning_count: Variable. value is set to Hash Collection value returned in winning_results_frequency_for_each_nominee Method.
  # no_wins_arr: Variable. sets value to results in checking_for_no_wins_results_frequency_for_each_nomine
  #
  # RETURNS appended winning_count Hash array
  def appending_no_wins_to_nominee_winner_results_frequency
    winning_count = winning_results_frequency_for_each_nominee
    no_wins_arr = checking_for_no_wins_results_frequency_for_each_nominee

    no_wins_arr.each do |loser| 
      if (loser != nil) && (loser != 0)
        winning_count[loser] = 0 
      end
    end

    return winning_count
  end

  #Creates Hash array for every row in scoped Results table. Key is set to winner_id + loser_id String. Value is the freqency with which that data appears in Results Collection

  # RETURNS Hash array.
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



# def ordering_and_checking_for_tie
#   nominees = self.appending_no_wins_to_nominee_winner_results_frequency
#   combo_count = self.results_frequency_for_each_combination
#   ranked= {}
#   tied_teams = {}

#   score = nil
 
# while @first_nominee <= nominees.length do  | key, value, value_b |
#   #     if nominees.length <= 1
#   #          ordered_arr << nominees[@first_index_nominee]
#   #          ranked_arr  << [key, value]

end
