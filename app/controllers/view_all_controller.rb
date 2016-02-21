#Shows all bands/artists added
MyApp.get "/all_rockers" do 
  @rockers = Rocker.all 

  erb :"all_rockers"
end