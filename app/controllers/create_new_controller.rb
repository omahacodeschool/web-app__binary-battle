

MyApp.get "/add_characters" do
   @characters = Character.all
  erb :"add_characters"
end

MyApp.post "/newcharacter" do
  @characters = Character.all
  c = Character.new
  c.character_name = params[:charactername]
  c.save
  erb :"add_characters"

end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")
#
#
#DB.define_table("battles")
#DB.define_column("battles","winner_id","integer")
#DB.define_column("battles","loser_id","integer")