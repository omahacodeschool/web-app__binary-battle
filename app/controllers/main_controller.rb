MyApp.get "/" do 
  @display_planets = Planet.select_two_planets
  erb :"main/welcome"
end

MyApp.get "/first_choice_selected" do
  erb :"main/first_choice_selected"
end

MyApp.get "/second_choice_selected" do
  erb :"main/second_choice_selected"
end















MyApp.post "/planet_submitted" do
  x = Planet.new
  x.planet = params[:planet_name]
  x.points = 0
  x.save
  erb :"main/planet_submitted"
end