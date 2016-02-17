#Add a Movie to DB
MyApp.post "/add_movie" do
  s = Movie.new
  s.movie_name = params["input_movie"]
  s.voted = false
  s.save

  erb :"/successful_vote"
end