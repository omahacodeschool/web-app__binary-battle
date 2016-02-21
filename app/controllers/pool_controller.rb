MyApp.get "/battles" do
  @category = Category.all

  erb :"/battles/view_battles"
end

MyApp.post "/battles/battle/:id/play" do
  @category = Category.find_by_id(params[:id])
  @pool = @category.get_pool
  erb :"/battles/view_battle"
end
