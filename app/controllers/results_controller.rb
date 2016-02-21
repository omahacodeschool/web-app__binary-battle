MyApp.post "/results" do
  x = Result.new
  x.comp_id_1 = params["comp_id_1"]
  x.comp_id_2 = params["comp_id_2"]
  x.winner = params["winner"]
  x.save
  @y = [x.comp_id_1, x.comp_id_2, x.winner]
  erb :"results/results"
end

MyApp.get "/all_results" do 
  @results = Result.all
  erb :"results/results_list"
end 

MyApp.get "/view_result/:result_id" do 
  @result = Result.find_by_id(params[:result_id])
  erb :"results/single_result"
end