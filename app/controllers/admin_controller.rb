#Shows the form for adding a band or artist
MyApp.get "/add" do 
  @add_band = Band.all 
  erb :"add"
end

#Processes the form for adding a band or artist
MyApp.post "/added" do 
  x = Band.new
  x.name = params["name"]
  if x.is_valid == true
    x.save
    erb :"added"
  else
    erb :"error"
  end
end

#Shows all bands/artists added
MyApp.get "/all_bands" do 
  @all_bands = Band.all 

  erb :"all_bands"
end


