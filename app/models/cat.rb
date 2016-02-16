class Cat < ActiveRecord::Base
	def list_likes
		likes = Result.where("winner_id" => self.id)
		return likes
	end

	def count_likes
		how_many_likes = self.list_likes
		return how_many_likes.length
	end

	def rank_cats
		cat_hash = []
		Cat.each do |c|
			cat_hash["c.name"] = c.count_likes
		end

		ordered_list = cat_hash.sort_by {|k,v| v}

		top_score = ordered_list.values.max

		list_top_cats = top_score.select { |k, v| v == top_score}

		if list_top_cats.length == 1
			return ordered_list

		else 
			return ordered_list
		end
	end

end

