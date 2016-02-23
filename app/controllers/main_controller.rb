MyApp.get "/" do
  @fighters = Fighter.all
  erb :"main/main"
end