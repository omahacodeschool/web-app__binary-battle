MyApp.get "/" do
  @movies = Movie.all
  @random_movie1 = @movies.find_by_id(1+rand(6)) 
  @random_movie2 = @movies.find_by_id(1+rand(6))
  #binding.pry
  erb :"homepage"
end
#Go to View to add movies
MyApp.get "/new_movie" do
  erb :"create_movie"
end
#Go to View to see movies and votes
MyApp.get "/show_movies" do
  @movies = Movie.all
  @sorted = @movies.order("vote_count DESC")
  erb :"display_movies"
end
