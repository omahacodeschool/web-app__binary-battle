MyApp.post "/results/:winner" do
  x = Result.new
  x.comp_id_1 = params[]
  x.comp_id_2 = params[]
  x.winner = x.comp_id_1
  x.save
  @y = [x.comp_id_1, x.comp_id_2, x.winner]
  erb :"results/results_1"
end

MyApp.get "/all_results" do 
  @results = Result.all
  erb :"results/results_list"
end 

MyApp.get "/view_result/:result_id" do 
  @result = Result.find_by_id(params[:result_id])
  erb :"results/single_result"
end