require 'pry'

MyApp.get "/" do
  characters = Character.all
  @char1 = characters.sample
  @char2 = characters.sample
  if @char1.id == @char2.id
    redirect to ("/")
  else
    erb :"battle"
  end
end

MyApp.post "/vote" do
  b = Battle.new
  b.winner_id = params[:winner]
  b.loser_id = params[:loser]
  b.save
  erb :"votesuccess"

end


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
#
#DB.define_table("xanders")
#DB.define_column("xanders","character_id","integer")