MyApp.get "/bestlegs_voting_page" do
  @display_planets = Planet.select_two_planets
  erb :"main/best_legs/bestlegs_voting_page"
end

MyApp.get "/legs_selected/:num" do
  @planet_chosen = params[:num]
  @planet_object = Planet.find_by_planet(@planet_chosen)
  @current_score_of_planet_chosen = @planet_object.legs_points
  @new_points = @current_score_of_planet_chosen + 1
  @planet_object.legs_points = @new_points
  @planet_object.save
  erb :"main/best_legs/legs_selected"
end

MyApp.get "/bestlegs_ranking" do
  @planets = Planet.all
  @ordered_legs = @planets.order('legs_points DESC')
  erb :"main/best_legs/bestlegs_ranking"
end