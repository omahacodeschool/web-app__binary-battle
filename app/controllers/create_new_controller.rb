
MyApp.get "/create_universe" do
  @universes = Universe.all
  erb :"/create/add_universe"
end

MyApp.post "/newuniverse" do
  u = Universe.new
  u.universe_name = params[:universename]
  u.save
  @universe = u 
  erb :"/create/add_characters"
end

MyApp.get "/add_characters" do
  @currentuniverse = Universe.find_by_id(@universe)
  @characters = Character.where({"universe_id" => @universe.id})
  erb :"/create/add_characters"
end

MyApp.post "/newcharacter" do
  @characters = Character.where({"universe_id" => params[:universeid]})
  c = Character.new
  c.character_name = params[:charactername]
  c.universe_id = params[:universeid]
  c.save
  @universe = Universe.find_by_id(params[:universeid])
  @characters = Character.where({"universe_id" => params[:universeid]})
  erb :"/create/add_characters"

end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")
#
#
#DB.define_table("battles")
#DB.define_column("battles","winner_id","integer")
#DB.define_column("battles","loser_id","integer")