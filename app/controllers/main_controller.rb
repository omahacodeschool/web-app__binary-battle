MyApp.get "/" do
  @competitors = Competitor.all
  competitors = @competitors.limit(2).order("RANDOM()")
  @comp_1 = competitors[0].name
  @comp_2 = competitors[1].name
  @type = competitors[0].competitor_type
  erb :"main/main"
end

MyApp.get "/thank_you"
  erb :"main/thank_you"
end