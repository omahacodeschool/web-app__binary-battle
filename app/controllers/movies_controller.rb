MyApp.get "/add_movie" do
  
  erb :"admin/add_movie"
end

MyApp.post "/add_movie_form" do
  @movies = Movie.all
  @movie  = Movie.new

  @movie.movie_title = (params["movie_title"])
  @movie.save

  erb :"admin/add_movie"
end 