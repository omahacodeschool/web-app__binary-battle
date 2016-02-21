MyApp.get "/" do 
  @display_planets = Planet.select_two_planets
  @new_showdown = Showdown.new
  @new_showdown.choice_one = @display_planets[0]
  @new_showdown.choice_two = @display_planets[1]
  @new_showdown.frequency_one = 0
  @new_showdown.frequency_two = 0
  @new_showdown.save
  erb :"main/welcome"
end

MyApp.get "/choice_selected/:num" do
  @planet_chosen = params[:num]
  @planet_object = Planet.find_by_planet(@planet_chosen)
  @current_score_of_planet_chosen = @planet_object.points
  @new_points = @current_score_of_planet_chosen + 1
  @planet_object.points = @new_points
  @planet_object.save

  @last_showdown = Showdown.last
  if @last_showdown.choice_one == @planet_chosen
    @current_score_of_freq_one = @last_showdown.frequency_one
    @new_score_of_freq_one = @current_score_of_freq_one + 1
    @last_showdown.frequency_one = @new_score_of_freq_one
    @last_showdown.save
    binding.pry
  elsif @last_showdown.choice_two == @planet_chosen
    #give point to frequency_two
  end
  erb :"main/choice_selected"
end

MyApp.get "/planets_ranking" do
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
  x.save
  erb :"main/planet_submitted"
end