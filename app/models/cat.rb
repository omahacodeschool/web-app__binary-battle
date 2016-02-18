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
		total_likes = how_many_likes.length
		return total_likes
	end


	#this method stores the Cat object name and the object's
	#number of likes inside of a hash and then sorts them by max value
	#this method takes the sorted list of Cat objects and their likes
	#and finds the Cat object or objects with the top score and stores
	#them in a hash
	#if there is only one top scorer, it returns the ordered list (for now)
	def Cat.rank_cats
		cat_hash = {}
		all_cats = Cat.all

		all_cats.each do |cat|
			name = cat.name
			likes = cat.count_likes
			cat_hash[name] = likes
		end

		ordered_list = cat_hash.sort_by {|k,v| v}.reverse.to_h
		list_top_cats = ordered_list.select { |k, v| v == ordered_list.values.max}
		binding.pry

		if list_top_cats.count == 1
			return ordered_list

		else
			# list_top_cats.each do |cat|
			# 	cat_name = cat.name
			# 	who_beat_who_more_often(cat_name)
			# compare each cat with the other cats in the table
			# who_beat_who_more_often(list_top_cats)
			return ordered_list
		end
	end


	#this method compares two Cats and checks which one has 
	#been winner more often when the other has been loser
	def who_beat_who_more_often(cat_one, cat_two)
		cat1 = Cat.where("name" => cat_one)
		cat2 = Cat.where("name" => cat_two)
		cat1_wins = Result.where("winner_id" => cat1.id, "loser_id" => cat2.id)
		cat2_wins = Result.where("winner_id" => cat2.id, "loser_id" => cat1.id)
		if cat1_wins.length > cat2_wins.length
			return cat1
		elsif cat1_wins.length < cat2_wins.length
			return cat2
		else
			return nil
		end
	end
end

