#Add a Movie to DB
MyApp.post "/add_movie" do
  s = Movie.new
  s.movie_name = params["input_movie"]
  s.vote_count = 0
  s.save

  erb :"/movies/movie_added"
end

#Increment the movie in questions vote count by 1
MyApp.post "/add_vote/:id" do
  @w = Movie.find_by_id(params[:id])
  @w.increment!(:vote_count)
  @w.save
erb :"/movies/movie_voted"
end

#Add a Building to DB
MyApp.post "/add_building" do
  b = Building.new
  b.building_name = params["input_building"]
  b.building_image = params["input_url"]
  b.architect = params["input_architect"]
  b.vote_count = 0
  b.save
  erb :"/buildings/building_added"
end

#Increment the chosen building's vote count by 1
MyApp.post "/building_vote/:id" do
  @w = Building.find_by_id(params[:id])
  @w.increment!(:vote_count)
  #binding.pry
  @w.save
  erb :"/buildings/building_voted"
end