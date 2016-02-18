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
  @winner = Character.find_by_id(params[:winner])
  @loser = Character.find_by_id(params[:loser])
  binding.pry
  erb :"votesuccess"

end

#DB.define_table("characters")
#DB.define_column("characters","character_name","string")
#
#
#DB.define_table("battles")
#DB.define_column("battles","winner_id","integer")
#DB.define_column("battles","loser_id","integer")