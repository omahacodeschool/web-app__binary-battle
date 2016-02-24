require 'pry'

MyApp.get "/" do
  @universes = Universe.all
  erb :"home"
end

MyApp.get "/battle/:id" do
  @universe = Universe.find_by_id(params[:id])
  if @universe.enough_characters == false
    erb :"not_enough"
  elsif @universe.enough_characters == true
    @char1, @char2 = @universe.get_two
    erb :"battle"
  end
end

MyApp.post "/vote" do
  #saves the winner and loser to the battle table
  b = Battle.new
  b.winner_id = params[:winner]
  b.loser_id = params[:loser]
  b.save
  @winner = Character.find_by_id(params[:winner])
  @loser = Character.find_by_id(params[:loser])
  @universe = Universe.find_by_id(params[:universe])
  erb :"votesuccess"
end

MyApp.get "/ranks/:id" do
  #finds the best to worst character
  @universe = Universe.find_by_id(params[:id])
  characters = Character.where("universe_id" => @universe.id)
  @arr = Character.find_ties(characters)

  #returns an array, sorted most to least
  #@winner is the name of the #1 spot
  @winner = @arr[0][0]
  erb :"ranks"
end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")
#
#
#DB.define_table("battles")
#DB.define_column("battles","winner_id","integer")
#DB.define_column("battles","loser_id","integer")
#
#
#DB.define_table("universes") 
#DB.define_column("universes","universe_name","string")