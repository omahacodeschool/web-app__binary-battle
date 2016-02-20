MyApp.get "/" do
  @hero_1, @hero_2 = Avenger.all.sample(2)
  @showdown = Showdown.new
  @showdown.hero_1_id = @hero_1.id
  @showdown.hero_2_id = @hero_2.id
  @showdown.save
  erb :'homepage'
end

MyApp.get "/admin" do
  @avengers = Avenger.all
  erb :'admin'
end 

MyApp.post "/new_avenger" do
  @avenger = Avenger.new
  @avenger.name = params["new_avenger"]
  @avenger.save
  redirect :'admin'
end

MyApp.post "/process_vote/:showdown_id" do
  x = params["hero_vote"]
  @winner = Avenger.find_by_id(x) 
  @winner.save
  @showdown = Showdown.find_by_id(params[:showdown_id])
  @showdown.winner_id = x
  @showdown.save

  redirect "/results"
end 

MyApp.get "/results" do
  @avengers = Avenger.all
  erb :'results'
end


