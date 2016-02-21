MyApp.get "/" do

  erb :"homepage"
end
#Go to view to vote for movies
MyApp.get "/home_movies" do
  movies = Movie.all
  sample = movies.sample(2)
  @random_movie1 = sample[0] 
  @random_movie2 = sample[1]
  @showdown = Count.new
  @showdown.movie1_id = @random_movie1.id
  @showdown.movie2_id = @random_movie2.id
  @showdown.save
  erb :"/movies/movie_home"
end
#Go to View to add movies
MyApp.get "/new_movie" do
  erb :"/movies/create_movie"
end
#Go to View to see movies and votes
MyApp.get "/show_movies" do
  x = Count.all
  @sorted = x.winning_movie
  erb :"/movies/display_movies"
end

#Go to view to vote for buildings
MyApp.get "/home_buildings" do
  buildings = Building.all
  sample = buildings.sample(2)
  @building1 = sample[0]
  @building2 = sample[1]
  erb :"/buildings/building_home"
end
#Go to View to add buildings
MyApp.get "/new_building" do
  erb :"/buildings/create_building"
end

#Go to View to see buildings and votes
MyApp.get "/show_buildings" do
  @buildings = Building.all
  @sorted = @buildings.order("vote_count DESC")
  erb :"/buildings/display_buildings"
end







