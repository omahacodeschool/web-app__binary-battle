MyApp.get "/add_fighter_form" do
  erb :"fighters/add_fighters"
end

MyApp.post "/added_fighters" do
  x = Fighter.new
  x.name = params["name"]
  x.fighter_style = params["figher_style"]
  x.save
  @y = [x.name, x.fighter_style]
  erb :"fighters/added"
end 

MyApp.get "/all_fighters" do 
  @fighters = Fighter.all
  erb :"fighters/fighters_list"
end