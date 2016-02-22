#battle royal controller

MyApp.get "/battle_royale" do
  @universe = Universe.find_by_id(params[:id])
  characters = Character.where({"universe_id" => @universe.id})
  characters = characters.shuffle
  @char1 = characters.pop
  @char2 = characters.pop
  
  erb :"/battle_royal/battle_royale"
  
end