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
	def Cat.get_all_cats_like_counts
		cat_hash = {}
		all_cats = Cat.all

		all_cats.each do |cat|
			name = cat.name
			likes = cat.count_likes
			cat_hash[name] = likes
		end
		return cat_hash
	end


	def Cat.rank_cats
		cat_hash = Cat.get_all_cats_like_counts
		@ordered_list = cat_hash.sort_by {|k,v| v}.reverse.to_h
		@list_top_cats = @ordered_list.select { |k, v| v == @ordered_list.values.max}

		if @list_top_cats.count == 1
			return @ordered_list

		else 
			return who_beat_who_more_often
		# else
		# 	cat_one = list_top_cats.keys[0]
		# 	cat_two = list_top_cats.keys[1]

		# 	cat1 = Cat.where(:name => cat_one).first
		# 	cat2 = Cat.where(:name => cat_two).first

		# 	cat1_wins = Result.where("winner_id" => cat1.id, "loser_id" => cat2.id)
		# 	cat2_wins = Result.where("winner_id" => cat2.id, "loser_id" => cat1.id)

		# 	if cat1_wins == nil || cat2_wins == nil || cat1_wins == nil && cat2_wins== nil 
		# 		return nil
		# 	elsif cat1_wins.length > cat2_wins.length
		# 		return ordered_list
		# 	elsif cat1_wins.length < cat2_wins.length
		# 		return
		# 		# put cat2 in first postition of ordered_list
		# 	end

		end
	end



		# else
		# 	list_top_cats.each do |cat, likes|
		# 		other_cats = list_top_cats.select{|key, hash| key != cat}
		# 			other_cats.each do |k,v|
		# 				#move winner to first position in hash
		# 	return modified_ordered_list 


	# this method compares two Cats and checks which one has 
	# been winner more often when the other has been loser
	def who_beat_who_more_often
		cat_one = @list_top_cats.keys[0]
		cat_two = @list_top_cats.keys[1]

		cat1 = Cat.where(:name => cat_one).first
		cat2 = Cat.where(:name => cat_two).first

		cat1_wins = Result.where("winner_id" => cat1.id, "loser_id" => cat2.id)
		cat2_wins = Result.where("winner_id" => cat2.id, "loser_id" => cat1.id)

		if cat1_wins == nil || cat2_wins == nil || cat1_wins == nil && cat2_wins== nil 
			return nil
		elsif cat1_wins.length > cat2_wins.length
			return ordered_list
		elsif cat1_wins.length < cat2_wins.length
			winner = @list_top_cats[1]
			@ordered_list.delete[1]
			modified_ordered_list = Hash[winner].merge!(@ordered_list)
			binding.pry
			return modified_ordered_list
			 
		end
	end
end
