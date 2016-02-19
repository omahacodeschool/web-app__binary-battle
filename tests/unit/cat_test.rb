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

    @cat4 = Cat.new
    @cat4.name = "Baby Boy"
    @cat4.save

    @cat5 = Cat.new
    @cat5.name = "Gracey"
    @cat5.save

    @result_1 = Result.new
    @result_1.winner_id = @cat1.id
    @result_1.loser_id = @cat2.id
    @result_1.winner_order = 1
    @result_1.save

    @result_2 = Result.new
    @result_2.winner_id = @cat1.id
    @result_2.loser_id = @cat2.id
    @result_2.winner_order = 2
    @result_2.save

    @result_3 = Result.new
    @result_3.winner_id = @cat1.id
    @result_3.loser_id = @cat3.id
    @result_3.winner_order = 1
    @result_3.save

    @result_4 = Result.new
    @result_4.winner_id = @cat2.id
    @result_4.loser_id = @cat1.id
    @result_4.winner_order = 1
    @result_4.save

    @result_5 = Result.new
    @result_5.winner_id = @cat3.id
    @result_5.loser_id = @cat2.id
    @result_5.winner_order = 2
    @result_5.save

    @result_6 = Result.new
    @result_6.winner_id = @cat3.id
    @result_6.loser_id = @cat1.id
    @result_6.winner_order = 1
    @result_6.save

    @result_7 = Result.new
    @result_7.winner_id = @cat3.id
    @result_7.loser_id = @cat2.id
    @result_7.winner_order = 2
    @result_7.save

    @result_8 = Result.new
    @result_8.winner_id = @cat1.id
    @result_8.loser_id = @cat2.id
    @result_8.winner_order = 2
    @result_8.save

    @result_9 = Result.new
    @result_9.winner_id = @cat3.id
    @result_9.loser_id = @cat1.id
    @result_9.winner_order = 1
    @result_9.save
  end

  def test_list_likes
    assert_includes(@cat1.list_likes, @result_1)
    refute_includes(@cat2.list_likes, @result_1)
  end

  def test_count_likes
    assert_equal(@cat1.count_likes, 4)
    assert_equal(@cat3.count_likes, 4)
    refute_equal(@cat1.count_likes, 2)
  end

  def test_collect_all_the_likes
    Cat.get_all_cats_like_counts
    assert_equal(Cat.get_all_cats_like_counts, cat_hash = {"Gita"=>4, "Clementine"=>1, "XiaoGui"=>4, "Baby Boy"=>0, "Gracey"=>0})
  end

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