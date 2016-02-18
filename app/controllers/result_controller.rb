MyApp.get "/results" do

  erb :"/results/view_results"
end

MyApp.get "/results/add" do

  erb :"/results/add_results"
end

MyApp.post "/results/add/confirmation" do
  @result = result.New

  redirect :"/results/results/result/#{@result_id}"
end

MyApp.post "/results/result/:id/delete" do
  @result = result.find_by_id(params[:id])

  redirect :"/results"
end

MyApp.get "/results/result/:id" do
  @result = result.find_by_id(params[:id])

  erb :"/results/view_result"
end

MyApp.get "/results/result/:id/update" do
  @result = result.find_by_id(params[:id])

  erb :"/results/update_result"
end

MyApp.post "/results/result/:id/update/confirmation" do
  @result = result.find_by_id(params[:id])

  redirect :"/results/result/#{@result_id}"
end