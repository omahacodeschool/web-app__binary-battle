MyApp.get "/" do
  erb :"home"
end

#Shows the form for voting for one of two bands
MyApp.get "/" do 
  @bands = Band.all
  x = Band.ids.sample(2)

  @band_1 = @bands.find_by_id(x[0])
  @band_2 = @bands.find_by_id(x[1])
  
  erb :"home"
end

#Processes the voting form
MyApp.post "/voted" do 
  x = Result.new
  
  x.save

  erb :"voted"
end
