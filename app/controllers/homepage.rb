
#Homepage view 
MyApp.get "/" do
  @artist = Artist.all
  @artist1, @artist2 = @artist.sample(2)
  erb :"vote" 
end

#submit users vote
MyApp.post "/submit_vote/:winner/:loser" do
  @winner = Artist.find_by_id(params[:winner]) 
  @loser = Artist.find_by_id(params[:loser])
  @winner.increment(:score, 1)
  @winner.save
  @battle = Battle.new
  @battle.winner = @winner.name
  @battle.loser = @loser.name
  @battle.save
  erb :"success_vote"
end

#process new artist form
MyApp.post "/process_artist" do
  @a = Artist.new
  @a.name = params["name"]
  @a.save
  erb :"success_new_artist"
end

#view artist and their results
MyApp.get "/view_artist" do
  @a = Artist.all.order(score: :desc)
  @b = Battle.all
  erb :"artist_rank"
end

#admin page
MyApp.get "/admin" do
  erb :"/add_artist"
end

  

