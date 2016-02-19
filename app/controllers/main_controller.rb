require 'pry'

MyApp.get "/" do
  @universes = Universe.all
  erb :"home"
end

MyApp.get "/battle/:id" do
  @universe = Universe.find_by_id(params[:id])
  characters = Character.where({"universe_id" => @universe.id})
  #chooses 2 random characters
  @char1 = characters.sample
  @char2 = characters.sample
  #if it's the same character twice, picks 2 more
  if @char1.id == @char2.id
    redirect to ("/battle/:id")
  else
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
  erb :"votesuccess"
end

MyApp.get "/ranks" do
  #finds the best to worst character
  characters = Character.all
  ranks = Hash.new
  
  characters.each do |character|
    x = character.rank
    ranks[character.character_name] = x
  end
  
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