MyApp.get "/" do
  @hero_1, @hero_2 = Avenger.all.sample(2)
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
  chosen_hero = params["hero_vote"]
  @avenger = Avenger.find_by_id(chosen_hero)
  @avenger.votes +=1
  @avenger.save
  @avengers = Avenger.all
  redirect "/results"
end 

MyApp.get "/results" do
  @avengers = Avenger.all
  erb :'results'
end
