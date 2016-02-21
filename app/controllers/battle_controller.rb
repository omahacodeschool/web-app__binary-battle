MyApp.get "/" do
  
  x = Battle.new
  x.run_battle

  @battle = x
  
  erb :"/home_page"
end

MyApp.post "/vote/:battle/:winner/:loser" do # "a" or "b"

@battle = Battle.find_by_id(params[:battle])
@battle.movie_loser = params[:loser]
@battle.movie_winner = params[:winner]
@battle.save

  erb :"/results"
end
