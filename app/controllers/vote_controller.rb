# Homepage shows the form for voting for one of two bands
MyApp.get "/" do
  @band_1, @band_2 = Band.all.sample(2)

  erb :"home"
end


# Processes the voting form
MyApp.post "/voted/???" do 
  x = Result.new

  erb :"voted"
end

