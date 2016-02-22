MyApp.post "/vote_added/:winner/:loser" do
  @winner = Legend.find(params[:winner])
  @loser = Legend.find(params[:loser])
  @result = Result.new
  @result.winner_id = @winner.id
  @result.loser_id = @loser.id
  @result.save
  erb :"results/vote_added"
end

MyApp.get "/results" do
  @legend_wins = Legend.wins_hash
  @legend_win_per = Legend.win_percentage_hash
  @results = Result.all
  erb :"results/results"
end

