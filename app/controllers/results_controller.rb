MyApp.post "/results/:winner/:loser" do
  x = Result.new
  x.comp_id_1 = params["winner"]
  x.comp_id_2 = params["loser"]
  x.winner = params["winner"]
  x.save
  @y = [x.comp_id_1, x.comp_id_2, x.winner]
  erb :"results/results"
end

MyApp.get "/all_results" do 
  @results = Result.all
  result = @results.limit(1).order("RANDOM()")
  @result = result[0]
  erb :"results/results_list"
end 

MyApp.get "/view_result/:result_id" do 
  @result = Result.find_by_id(params[:result_id])
  erb :"results/single_result"
end