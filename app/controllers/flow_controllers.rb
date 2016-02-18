MyApp.get "/" do

  erb :"homepage"
end
#Go to view to vote for movies
MyApp.get "/home_movies" do
  @movies = Movie.all
  @random_movie1 = @movies.find_by_id(1+rand(6)) 
  @random_movie2 = @movies.find_by_id(1+rand(6))
  @sample = @movies.sample(2)
  #binding.pry
  erb :"/movies/movie_home"
end
#Go to View to add movies
MyApp.get "/new_movie" do
  erb :"/movies/create_movie"
end
#Go to View to see movies and votes
MyApp.get "/show_movies" do
  @movies = Movie.all
  @sorted = @movies.order("vote_count DESC")
  erb :"/movies/display_movies"
end

#Go to view to vote for buildings
MyApp.get "/home_buildings" do
  # @buildings = Building.all

  # @sample = @movies.sample(2)
  #binding.pry
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







