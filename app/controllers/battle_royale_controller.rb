#battle royal controller

MyApp.get "/battle_royale" do
  @char1, @char2 = Universe.get_two_battle_royale
  erb :"/br/battle_royale"  
end

MyApp.post "/royalevote" do
    #saves the winner and loser to the battle table
    b = Battle.new
    b.winner_id = params[:winner]
    b.loser_id = params[:loser]
    b.save
    @winner = Character.find_by_id(params[:winner])
    @loser = Character.find_by_id(params[:loser])
    erb :"/br/royalevote"
end

MyApp.get "/royaleranks" do
  characters = Character.all
  @arr = Character.find_ties(Character.ranked_array(characters))

  #returns an array, sorted most to least
  #@winner is the name of the #1 spot
  @winner = @arr[0][0]

  erb :"/br/royaleranks"
end
