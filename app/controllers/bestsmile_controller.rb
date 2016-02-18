MyApp.get "/bestsmile_voting_page" do
  @display_planets = Planet.select_two_planets
  erb :"main/best_smile/bestsmile_voting_page"
end

MyApp.get "/smile_selected/:num" do
  @planet_chosen = params[:num]
  @planet_object = Planet.find_by_planet(@planet_chosen)
  @current_score_of_planet_chosen = @planet_object.smile_points
  @new_points = @current_score_of_planet_chosen + 1
  @planet_object.smile_points = @new_points
  @planet_object.save
  erb :"main/best_smile/smile_selected"
end

MyApp.get "/bestsmile_ranking" do
  @planets = Planet.all
  @ordered_smiles = @planets.order('smile_points DESC')
  erb :"main/best_smile/bestsmile_ranking"
end