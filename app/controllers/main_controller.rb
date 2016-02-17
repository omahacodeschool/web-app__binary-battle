#WOULDNT IT BE NICE IF YOU COULD MAKE A BASIC CONTROLLER AND NOT HAVE IT BE BROKEN

MyApp.get "/" do
  erb :"home"
end

MyApp.get "/add_characters" do
  erb :"add_characters"
end

MyApp.post "/newcharacter" do
  @characters = Character.all
  c = Character.new
  c.character_name = character_name
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
#
#DB.define_table("xanders")
#DB.define_column("xanders","character_id","integer")