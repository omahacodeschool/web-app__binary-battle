MyApp.get "/" do 
  erb :"main/welcome"
end

MyApp.get "/vote_for_planet" do
  @display_planets = Planet.select_two_planets
  @new_showdown = Showdown.new
  @new_showdown.choice_one = @display_planets[0]
  @new_showdown.choice_two = @display_planets[1]
  @new_showdown.save
  @id_of_new_showdown = @new_showdown.id
  @id_of_last_showdown = @id_of_new_showdown - 1
  @last_showdown = Showdown.find_by_id(@id_of_last_showdown)
  @new_showdown.frequency_one = @last_showdown.frequency_one
  @new_showdown.frequency_two = @last_showdown.frequency_two
  @new_showdown.save
  erb :"main/vote_for_planet"
end

MyApp.get "/choice_selected/:num" do
  @planet_chosen = params[:num]
  @planet_object = Planet.find_by_planet(@planet_chosen)
  @current_score_of_planet_chosen = @planet_object.points
  @new_points = @current_score_of_planet_chosen + 1
  @planet_object.points = @new_points
  @planet_object.save
  @last_showdown = Showdown.last
  @last_showdown.winner = @planet_object.planet
  @last_showdown.save
  @last_showdown.give_freq_point_to_chosen_option
  Planet.get_all_planets_win_records
  #set planets win records here
  erb :"main/choice_selected"
end

MyApp.get "/planets_ranking" do
  @last_showdown = Showdown.last
  @showdowns = Showdown.all
  @planets = Planet.all
  @ordered_planets = @planets.order('points DESC')
  erb :"main/planets_ranking"
end





MyApp.post "/planet_submitted" do
  x = Planet.new
  x.planet = params[:planet_name]
  x.points = 0
  x.legs_points = 0
  x.smile_points = 0
  x.pres_points = 0
  x.win_record = 0
  x.save
  erb :"main/planet_submitted"
end