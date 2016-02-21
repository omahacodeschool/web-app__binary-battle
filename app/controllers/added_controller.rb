#Processes the form for adding a band or artist
MyApp.post "/added" do 
  x = Rocker.new
  x.rocker_name = params["rocker_name"]
  x.save

  erb :"added"
end