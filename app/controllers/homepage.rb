
#Homepage view 
MyApp.get "/" do
  @a = Artist.limit(2).order("RANDOM()")
  erb :"vote" 
end

#submit users vote
MyApp.post "/submit_vote/:id" do
  @point = Artist.find_by_id(params[:id])
  @point.increment(:rank, 1)
  @point.save
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
  @a = Artist.all.order(rank: :asc)
  erb :"artist_rank"
end

#admin page
MyApp.get "/admin" do
  erb :"/add_artist"
end

  

