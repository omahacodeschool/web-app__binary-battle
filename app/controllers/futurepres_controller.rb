MyApp.get "/futurepres_voting_page" do
  @display_planets = Planet.select_two_planets
  erb :"main/future_pres/futurepres_voting_page"
end

MyApp.get "/pres_selected/:num" do
  @planet_chosen = params[:num]
  @planet_object = Planet.find_by_planet(@planet_chosen)
  @current_score_of_planet_chosen = @planet_object.pres_points
  @new_points = @current_score_of_planet_chosen + 1
  @planet_object.pres_points = @new_points
  @planet_object.save
  erb :"main/future_pres/pres_selected"
end

MyApp.get "/futurepres_ranking" do
  @planets = Planet.all
  @ordered_pres = @planets.order('pres_points DESC')
  erb :"main/future_pres/futurepres_ranking"
end