MyApp.get "/battles" do
  @category = Category.all

  erb :"/battles/view_battles"
end

MyApp.post "/battles/battle/:id/play" do
  @category = Category.find_by_id(params[:id])
  @pool = Pool.where({"category_id" => @category.id}).sample(2)
  @nominee_ids = @pool.get_selection_ids
  erb :"/battles/battle/#{@category.id}/play"
end


MyApp.post "/battles/battle/:id/voted" do
  @category = Category.find_by_id(params[:id])
  @nominees_results = Result.new
  @nominees_results.lost_id =
  @nominees_results.loved_id =
  @nominees_results.category_id = @category.id
  @nominees_results.locked = true
  @nominees_results.save
  redirect :"/battles/battle/#{@category.id}/play"
end
