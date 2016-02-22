require 'test_helper'

class ShowdownTest < Minitest::Test
  def setup
    super

    @s1 = Showdown.new
    @s1.choice_one = "Jupiter"
    @s1.choice_two = "Turkey"
    @s1.winner = @s1.choice_two
    @s1.frequency_one = 1
    @s1.frequency_two = 1
    @s1.save
  end

  def test_giving_freq_point
    @s1.give_freq_point_to_chosen_option
    assert_equal(@s1.frequency_one, 1)
    refute_equal(@s1.frequency_one, 2)
    assert_equal(@s1.frequency_two, 2)
    refute_equal(@s1.frequency_two, 1)
  end

end