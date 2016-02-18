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

MyApp.get "/delete_movie/:movie_id" do
  @movies = Movie.all
  @movie  = Movie.find_by_id(params[:movie_id])
  
  @movie.delete
    
  erb :"admin/add_movies"
end

MyApp.get "/update_movie/:movie_id" do
  @movies = Movie.all
  @movie  = Movie.find_by_id(params[:movie_id])

  erb :"admin/update_movie"
end

MyApp.post "/process_movie_update/:movie_id" do
  @movies = Movie.all
  @movie  = Movie.find_by_id(params[:movie_id])

  @movie.movie_title = (params["movie_title_update"])
  @movie.save

  erb :"admin/add_movies"
end