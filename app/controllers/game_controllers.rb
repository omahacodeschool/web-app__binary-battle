MyApp.get "/" do   

  @games = FinalFantasyGame.all
  x = FinalFantasyGame.ids.sample(2)

  @game1 = @games.find_by_id(x[0])
  @game2 = @games.find_by_id(x[1])

  erb :"homepage"

end

MyApp.post "/add_game" do

  x = FinalFantasyGame.new
  x.movie_title = params["game_title"]
  x.save

  erb :"add_success"
end
