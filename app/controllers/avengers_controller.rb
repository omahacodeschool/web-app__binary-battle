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
  @avenger.votes = 0
  @avenger.save
  redirect :'admin'
end

MyApp.post "/process_vote" do
  x = params["hero_vote"]
  @winner = Avenger.find_by_id(x)
  @winner.votes += 1

  redirect "/results"
end 

MyApp.get "/results" do
  @avengers = Avenger.all
  @ranked = @avengers.order("votes DESC")
  erb :'results'
end


