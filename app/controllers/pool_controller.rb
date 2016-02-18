MyApp.get "/pools" do

  erb :"/pools/view_pools"
end

MyApp.get "/pools/add" do

  erb :"/pools/add_pools"
end

MyApp.post "/pools/add/confirmation" do
  @pool = pool.New

  redirect :"/pools/pools/pool/#{@pool_id}"
end

MyApp.post "/pools/pool/:id/delete" do
  @pool = pool.find_by_id(params[:id])

  redirect :"/pools"
end

MyApp.get "/pools/pool/:id" do
  @pool = pool.find_by_id(params[:id])

  erb :"/pools/view_pool"
end

MyApp.get "/pools/pool/:id/update" do
  @pool = pool.find_by_id(params[:id])

  erb :"/pools/update_pool"
end

MyApp.post "/pools/pool/:id/update/confirmation" do
  @pool = pool.find_by_id(params[:id])

  redirect :"/pools/pool/#{@pool_id}"
end