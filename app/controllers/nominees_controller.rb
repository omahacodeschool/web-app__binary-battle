MyApp.get "/nominees" do

  erb :"/nominees/view_nominees"

MyApp.get "/nominees/add" do

  erb :"/nominees/add_nominees"
end

MyApp.post "/nominees/add/confirmation" do
  @nominee = nominee.New

  redirect :"/nominees/nominees/nominee/#{@nominee_id}"
end

MyApp.post "/nominees/nominee/:id/delete" do
  @nominee = nominee.find_by_id(params[:id])

  redirect :"/nominees"
end

MyApp.get "/nominees/nominee/:id" do
  @nominee = nominee.find_by_id(params[:id])

  erb :"/nominees/view_nominee"
end

MyApp.get "/nominees/nominee/:id/update" do
  @nominee = nominee.find_by_id(params[:id])

  erb :"/nominees/update_nominee"
end

MyApp.post "/nominees/nominee/:id/update/confirmation" do
  @nominee = nominee.find_by_id(params[:id])

  redirect :"/nominees/nominee/#{@nominee_id}"
end