MyApp.get "/" do 
  @display_planets = Planet.select_two_planets
  erb :"main/welcome"
end

MyApp.get "/choice_selected/:num" do
  @planet_chosen = params[:num]
  @planet_object = Planet.find_by_planet(@planet_chosen)
  @current_score_of_planet_chosen = @planet_object.points
  @new_points = @current_score_of_planet_chosen + 1
  @planet_object.points = @new_points
  @planet_object.save
  erb :"main/choice_selected"
end

MyApp.get "/planets_ranking" do
  @planets = Planet.all
  @ordered_planets = @planets.order('points DESC')
  erb :"main/planets_ranking"
end







  # MyApp.post "/planet_submitted" do
  #   x = Planet.new
  #   x.planet = params[:planet_name]
  #   x.points = 0
  #   x.save
  #   erb :"main/planet_submitted"
  # end