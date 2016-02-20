
#Homepage view 
MyApp.get "/" do
  @a = Artist.limit(2).order("RANDOM()")
  erb :"vote" 
end

#submit users vote
MyApp.get "/submit_vote/" do

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
  @a = Artist.all
  erb :"artist_rank"
end

#admin page
MyApp.get "/admin" do
  erb :"/add_artist"
end

  

