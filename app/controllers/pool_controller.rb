MyApp.get "/battles" do
  @category = Category.all

  erb :"/battles/view_battles"
end

MyApp.post "/battles/battle/select" do
  @error_test = Category.new
  @error_test.id = params[:category_battle_selection_dropdown]
  @nominees = Nominee.all
  if @error_test.is_valid_category_check == true
    @no_id_error = true
    @categories = Category.new
    erb :"main_errors"
  else
    @categories = Category.find_by_id(params[:category_battle_selection_dropdown])
    redirect :"/battles/battle/#{@categories.id}/play"
  end
end


MyApp.get "/battles/battle/:id/play" do
  @nominee_ids =[]
  @category = Category.find_by_id(params[:id])
  @pool = Pool.where({"category_id" => @category.id}).sample(2)
  if @pool.length <= 1
     @error = true
  else
    @pool.each do |id|
      if id != nil
       @nominee_ids << id.nominee_id.to_i
      end
    end
  end

  erb :"/battles/view_battle"
end


MyApp.post "/battles/battle/:id/cast_vote" do
  @category = Category.find_by_id(params[:id])
  @nominees_results = Result.new
  @nominees_results.loved_id = params[:battle_selection_radio]
 params[:nominee_ids].each do |loser|
    if loser != params[:battle_selection_radio]
      @nominees_results.lost_id = loser
      break
    end
  end
  @nominees_results.category_id = @category.id
  @nominees_results.locked = true
  @winner = Nominee.find_by_id(@nominees_results.loved_id)
  @loser = Nominee.find_by_id(@nominees_results.lost_id)
  @nominees_results.save
  erb :"/battles/view_battle_confirmation"
end
