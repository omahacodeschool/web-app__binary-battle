#Shows the form for adding a band or artist
MyApp.get "/add" do 
  @rockers = Rocker.all 
  erb :"add"
end