class Result < ActiveRecord::Base

    def results_frequency_for_each_nominee
        nominee_hash = Hash.new(0)
        count = 0
        nominee_grouping = self.all

        nominee_grouping.each { |winner| nominee_hash[winner.loved_id] = count += 1 }
        return nominee_hash
    end


    def results_frequency_for_each_combination
      result_hash = Hash.new(0)
      count = 0
      outcome_grouping = self.all 
      outcome_grouping.each do |winner, loser| 
        result_hash[winner.loved_id, lost.lost_id] = count += 1 
      end
      return result_hash
    end



end