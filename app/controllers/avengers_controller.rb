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