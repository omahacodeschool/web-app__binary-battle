
MyApp.get "/create_universe" do
  @universes = Universe.all
  erb :"/create/add_universe"
end

MyApp.post "/newuniverse" do
  u = Universe.new
  u.universe_name = params[:universename]
  u.save
  id = u.id
  erb :"/create/add_characters"
end

MyApp.get "/add_characters" do
  @current_universe = Universe.find_by_id(params[:id])
  @characters = Character.all
  erb :"/create/add_characters"
end

MyApp.post "/newcharacter" do
  @characters = Character.({"universe_id" => (params[:id])})
  c = Character.new
  c.character_name = params[:charactername]
  c.save
  erb :"/create/add_characters"

end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")
#
#
#DB.define_table("battles")
#DB.define_column("battles","winner_id","integer")
#DB.define_column("battles","loser_id","integer")