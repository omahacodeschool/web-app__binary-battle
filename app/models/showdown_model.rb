class Showdown < ActiveRecord::Base
  #returns Nil; adds one "frequency" point to whichever planet was most recently selected
  def give_freq_point_to_chosen_option
    @last_showdown = Showdown.last
    @planet_chosen = @last_showdown.winner
    if @last_showdown.choice_one == @planet_chosen
      @current_score_of_freq_one = @last_showdown.frequency_one
      @new_score_of_freq_one = @current_score_of_freq_one + 1
      @last_showdown.frequency_one = @new_score_of_freq_one
      @last_showdown.save
    elsif @last_showdown.choice_two == @planet_chosen
      @last_showdown.choice_two == @planet_chosen
      @current_score_of_freq_two = @last_showdown.frequency_two
      @new_score_of_freq_two = @current_score_of_freq_two + 1
      @last_showdown.frequency_two = @new_score_of_freq_two
      @last_showdown.save
    end
  end

end