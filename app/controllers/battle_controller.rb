MyApp.get "/" do
  
  @battle = Battle.new
  @battle.run_battle
  @left_movie = Movie.find_by_id(@battle.movie_left).movie_name
  @left_art = Movie.find_by_id(@battle.movie_left).movie_art

  @right_movie = Movie.find_by_id(@battle.movie_right).movie_name
  @right_art = Movie.find_by_id(@battle.movie_right).movie_art

  erb :"/home_page"
end


MyApp.post "/vote/:battle/:winner/:loser" do # "a" or "b"

@battle = Battle.find_by_id(params[:battle])
@battle.movie_loser = params[:loser]
@battle.movie_winner = params[:winner]
@battle.save

@winner_name = Movie.find_by_id(@battle.movie_winner).movie_name
@loser_name = Movie.find_by_id(@battle.movie_loser).movie_name

@winner_art = Movie.find_by_id(@battle.movie_winner).movie_art
@loser_art = Movie.find_by_id(@battle.movie_loser).movie_art
  erb :"/results"
end

MyApp.get "/rankings" do

  @battles = Battle.all

  erb :"/rankings"
end