#Add a Movie to DB
MyApp.post "/add_movie" do
  s = Movie.new
  s.movie_name = params["input_movie"]
  s.save

  erb :"/movies/movie_added"
end

#Increment the movie in questions vote count by 1
MyApp.post "/add_vote/:winning_id/:losing_id" do
  y = Movie.all
  @winner = y.find_by_id(params[:winning_id])
  @loser = params["loser"]
  showdown = Count.new
  showdown.winning_id = params[:winning_id]
  showdown.losing_id = params[:losing_id]
  winning_movie = y.find_by_id(params[:winning_id])
  wins = winning_movie.count_wins
  appearances = winning_movie.count_appearances
  percentage = (wins.to_f / appearances.to_f)
  @winner.winning_percentage = percentage
 
  #write cool stuff to calculate o.w.p.
  y.each do |i|
    win_percents = []
      next if i.id == @winner.id
    opponent_win_percent = i.opponents_win_percentage(@winner)
    win_percents << opponent_win_percent
    win_percent_average = win_percents.sum / win_percents.length
    i.o_w_p = win_percent_average
    i.save
  end
  @winner.save
  showdown.save
erb :"/movies/movie_voted"
end

#Add a Building to DB
MyApp.post "/add_building" do
  b = Building.new
  b.building_name = params["input_building"]
  b.building_image = params["input_url"]
  b.architect = params["input_architect"]
  b.save
  erb :"/buildings/building_added"
end

#Increment the chosen building's vote count by 1
MyApp.post "/building_vote/:winning_id/:losing_id" do
  @winner = Building.find_by_id(params[:winning_id])
  @loser = params["loser"]
  w = Match.new
  w.winning_id = params[:winning_id]
  w.losing_id = params[:losing_id]
  w.save
  #binding.pry

  erb :"/buildings/building_voted"
end