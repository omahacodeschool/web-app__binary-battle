class Cat < ActiveRecord::Base

	#this method finds all of the instances
	#in the Results table where the winner_id equals the cat_id
	#and returns all of those instances in an array
	def list_likes
		likes = Result.where("winner_id" => self.id)
		return likes
	end

	#This method takes the array from list_likes method
	#and counts the length to find out how many instances
	#there are for this Cat object
	def count_likes
		how_many_likes = self.list_likes
		return how_many_likes.length
	end


	#this method stores the Cat object name and the object's
	#number of likes inside of a hash and then sorts them by max value
	def store_cats_and_number_of_likes_by_max
		cat_hash = []
		Cat.each do |c|
			cat_hash["c.name"] = c.count_likes
		end
		return cat_hash.sort_by {|k,v| v}
	end

	#this method takes the sorted list of Cat objects and their likes
	#and finds the Cat object or objects with the top score and stores
	#them in a hash
	#if there is only one top scorer, it returns the ordered list (for now)
	def rank_cats
		ordered_list = store_cats_and_number_of_likes_by_max
		top_score = ordered_list.values.max
		list_top_cats = []
		list_top_cats = top_score.select { |k, v| v == top_score}

		if list_top_cats.length == 1
			return ordered_list

		else 
			return ordered_list
		end
	end

end

