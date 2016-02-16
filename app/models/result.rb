class Result < ActiveRecord::Base
	def list_likes
		likes = Result.where("winner_id" => self.id)
		return likes
	end

	def count_likes
		x = self.list_likes
		return list_likes.length
	end

	def ranking
		cat_hash = []
		Cat.each do |c|
			cat_hash["c.name"] = c.count_likes
		end
		rank = cat_hash.sort_by {|k,v| v}
		if rank.
		return rank
	end
end