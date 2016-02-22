
#Homepage view 
MyApp.get "/" do
  @artist = Artist.all
  @artist1, @artist2 = @artist.sample(2)
  erb :"vote" 
end

#submit users vote
MyApp.post "/submit_vote/:id" do
  binding.pry
  @artist = Artist.find_by_id(params[:id]) 
  @artist.increment(:score, 1)
  @artist.save
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
  erb :"artist_rank"
end

#admin page
MyApp.get "/admin" do
  erb :"/add_artist"
end

  

