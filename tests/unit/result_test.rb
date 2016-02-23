require 'test_helper'

class ResultTest < Minitest::Test
  def setup
      super

      @dworf1 = Dworf.new
      @dworf1.name = "Ben Seaver"
      @dworf1.save

      @dworf2 = Dworf.new
      @dworf2.name = "Peter Brady"
      @dworf2.save

  end

  def test_win_name
    assert_includes(@dworf1.name, @dworf1)
  end
  def test_loose_name
    assert_includes(@dworf2.name, @dworf2)
  end
end