MyApp.get "/battles" do

  erb :"/pools/view_pools"
end

MyApp.get "/battles/add" do
  @nominees = Nominee.all
  @categories = Category.all
  erb :"/pools/add_pool"
end

MyApp.post "/battles/add/confirmation" do
  @pool = Pool.new
  @nominees = Nominee.all
  @categories = Category.all
  @pool.name = params[:add_name]
  @pool.description = params[:pool_description_textarea]
  @pool.image = params[:add_pool_image_link]
  @pool.thumbnail = params[:add_pool_thumbnail_link]
  @pool.category_id = params[ :pool_category_dropdown]
  @pool.locked = false

  if Pool.exists?(:name => params[:add_name], :category_id => params[:pool_category_dropdown], :locked => false)
    @error = true
    erb :"/pools/add_pool"
  else
    @pool.save
    redirect :"/battles/battle/#{@pool.id}"
  end
end

MyApp.post "/battles/battle/:id/delete" do
  @pool = Pool.find_by_id(params[:id])

  redirect :"/battles"
end

MyApp.get "/battles/battle/:id" do
  @pool = Pool.find_by_id(params[:id])

  erb :"/pools/view_pool"
end

MyApp.get "/battles/battle/:id/update" do
  @pool = pool.find_by_id(params[:id])

  erb :"/pools/update_pool"
end

MyApp.post "/battles/battle/:id/update/confirmation" do
  @pool = pool.find_by_id(params[:id])

  redirect :"/battles/battle/#{@pool_id}"
end