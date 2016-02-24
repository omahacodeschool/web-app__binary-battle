require 'test_helper'

class DwarvesTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  # The actual tests go below this comment.

  def setup
    super
    @potato = "delicious"

    @dwarf1 = Dwarf.new
    @dwarf1.name = "Happy"
    @dwarf1.tally = 0
    @dwarf1.save

    @dwarf2 = Dwarf.new
    @dwarf2.name = "Sleepy"
    @dwarf2.tally = 0
    @dwarf2.save

    @dwarf3 = Dwarf.new
    @dwarf3.name = "Sneezy"
    @dwarf3.tally = 0
    @dwarf3.save

    @dwarf4 = Dwarf.new
    @dwarf4.name = "Dopey"
    @dwarf4.tally = 0
    @dwarf4.save

    @dwarf5 = Dwarf.new
    @dwarf5.name = "Bashful"
    @dwarf5.tally = 0
    @dwarf5.save

    @dwarf6 = Dwarf.new
    @dwarf6.name = "Grumpy"
    @dwarf6.tally = 0
    @dwarf6.save

    @dwarf7 = Dwarf.new
    @dwarf7.name = "Doc"
    @dwarf7.tally = 0
    @dwarf7.save
  end

  def test_potato
    assert_equal("delicious", @potato)
  end

  def test_if_entry_is_duplicate
    @new_dwarf = Dwarf.new
    @new_dwarf.name = "Happy"
    @new_dwarf2 = Dwarf.new
    @new_dwarf2.name = "Doc"

    assert_equal(true, @new_dwarf.is_duplicate)

  end

  def test_if_entry_is_blank
    @new_dwarf = Dwarf.new
    @new_dwarf.name = ""

    assert_equal(false, @new_dwarf.is_valid)
  end


end