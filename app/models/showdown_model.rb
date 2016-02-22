class Showdown < ActiveRecord::Base
  #returns Nil; adds one "frequency" point to whichever planet was most recently selected
  def give_freq_point_to_chosen_option
    @planet_chosen = self.winner
    if self.choice_one == @planet_chosen
      @current_score_of_freq_one = self.frequency_one
      @new_score_of_freq_one = @current_score_of_freq_one + 1
      self.frequency_one = @new_score_of_freq_one
      self.save
    elsif self.choice_two == @planet_chosen
      self.choice_two == @planet_chosen
      @current_score_of_freq_two = self.frequency_two
      @new_score_of_freq_two = @current_score_of_freq_two + 1
      self.frequency_two = @new_score_of_freq_two
      self.save
    end
  end

end