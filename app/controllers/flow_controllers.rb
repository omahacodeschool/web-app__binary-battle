MyApp.get "/" do
  erb :"homepage"
end
#Go to View to add movies
MyApp.get "/new_movie" do
  erb :"create_movie"
end
#Go to View to see movies and votes
MyApp.get "/show_movies" do
  @movies = Movie.all
  erb :"display_movies"
end