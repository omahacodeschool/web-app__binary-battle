MyApp.get "/" do 
  erb :"main/welcome"
end

MyApp.post "/planet_submitted" do
  x = Planet.new
  x.planet = params[:planet_name]
  x.points = 0
  x.save
  erb :"main/planet_submitted"
end