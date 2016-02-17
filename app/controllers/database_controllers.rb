#Add a Movie to DB
MyApp.post "/add_movie" do
  s = Movie.new
  s.movie_name = params["input_movie"]
  s.vote_count = 0
  s.save

  erb :"/movie_added"
end

#Increment the movie in questions vote count by 1
MyApp.post "/add_vote/:id" do
  @w = Movie.find_by_id(params[:id])
  @w.increment!(:vote_count)
  @w.save



#Put cool stuff here.
erb :"/movie_voted"
end