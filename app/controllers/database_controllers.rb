#Add a Movie to DB
MyApp.post "/add_movie" do
  s = Movie.new
  s.movie_name = params["input_movie"]
  s.vote_count = 0
  s.save

  erb :"/movie_added"
end