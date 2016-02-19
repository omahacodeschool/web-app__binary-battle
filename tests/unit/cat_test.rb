require 'test_helper'

class CatTest < Minitest::Test
  def setup
    super
    @cat1 = Cat.new
    @cat1.name = "Gita"
    @cat1.save

    @cat2 = Cat.new
    @cat2.name = "Clementine"
    @cat2.save

    @cat3 = Cat.new
    @cat3.name = "XiaoGui"
    @cat3.save

    @result_1 = Result.new
    @result_1.winner_id = @cat1.id
    @result_1.loser_id = @cat2.id
    @result_1.save

  end

  def test_list_likes
    assert_includes(@cat1.list_likes, @result_1)
    refute_includes(@cat2.list_likes, @result_1)
  end

  def test_count_likes
    assert_equal(@cat1.count_likes, 1)
    refute_equal(@cat1.count_likes, 2)
  end

  # def test_collect_all_the_likes
  #   assert_nil(@cat3.event_entry)
  # end

  # def test_rank_cats
  #   @cat2.delete_competitor_info
  #   assert_nil(@cat2.event_entry)
  # end

  # def test_who_beat_who
  #   @cat2.delete_competitor_info
  #   assert_nil(@cat2.event_entry)
  # end

  # def test_re_order_list
  #   @cat2.delete_competitor_info
  #   assert_nil(@cat2.event_entry)
  # end

  # def test_percentage
  #   @cat2.delete_competitor_info
  #   assert_nil(@cat2.event_entry)
  # end
end