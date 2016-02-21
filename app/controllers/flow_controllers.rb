MyApp.get "/" do

  erb :"homepage"
end
#Go to view to vote for movies
MyApp.get "/home_movies" do
  movies = Movie.all
  sample = movies.sample(2)
  @random_movie1 = sample[0] 
  @random_movie2 = sample[1]

  erb :"/movies/movie_home"
end
#Go to View to add movies
MyApp.get "/new_movie" do
  erb :"/movies/create_movie"
end
#Go to View to see movies and votes
MyApp.get "/show_movies" do
  x = Count.all
  @movie = Movie.all
  @sorted = x.winning_movie
  duplicates = @sorted
  arr = duplicates.group_by{|k, v| v}
  v = arr.select{|k,v| v.count > 1}.values.flatten(2)
  v.each do |i|
    tie_movies = i[0]
   binding.pry
 end
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







