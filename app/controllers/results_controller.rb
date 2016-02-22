MyApp.post "/vote_added/:winner/:loser" do
  @winner = Legend.find(params[:winner])
  @loser = Legend.find(params[:loser])
  @result = Result.new
  @result.winner_id = @winner.id
  @result.loser_id = @loser.id
  @result.save
  # binding.pry
  # redirect :"vote_added/#{@winner_id}/#{@loser_id}"
  erb :"results/vote_added"
end

MyApp.get "/results" do
  @legends = Legend.wins_hash
  @results = Result.all
  erb :"results/results"
end

