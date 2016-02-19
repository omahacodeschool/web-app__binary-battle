require 'pry'

MyApp.get "/" do
  @universes = Universe.all
  erb :"home"
end

MyApp.get "/battle/:id" do
  @universe = Universe.find_by_id(params[:id])
  characters = Character.where({"universe_id" => @universe.id})
  characters = characters.shuffle
  @char1 = characters.pop
  @char2 = characters.pop

  erb :"battle"
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
  characters = Character.where({"universe_id" => (params[:id])})
  ranks = Hash.new
  
  characters.each do |character|
    x = character.rank
    ranks[character.character_name] = x
  end
  binding.pry
  @arr = ranks.sort{|a1,a2| a2[1]<=>a1[1]}
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