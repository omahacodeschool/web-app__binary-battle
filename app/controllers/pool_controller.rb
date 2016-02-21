MyApp.get "/battles" do
  @category = Category.all

  erb :"/battles/view_battles"
end

MyApp.post "/battles/battle/:id/play" do
  @nominee_ids =[]
  @category = Category.find_by_id(params[:id])
  @pool = Pool.where({"category_id" => @category.id}).sample(2)
  @pool.each do |id|
    @nominee_ids << id.nominee_id
  end
  erb :"/battles/view_battle"
end


MyApp.post "/battles/battle/:id/results" do
  @category = Category.find_by_id(params[:id])
  @nominees_results = Result.new
  params[:nominee_ids].each do |loser|
    if loser != params[:battle_selection_radio]
      @nominees_results.lost_id = loser
    end
  @nominees_results.loved_id = params[:battle_selection_radio]
  @nominees_results.category_id = @category.id
  @nominees_results.locked = true
  @nominees_results.save
  redirect :"/battles/battle/#{@category.id}/play"
end
