MyApp.get "/" do
  @competitors = Competitor.all
  erb :"main/main"
end