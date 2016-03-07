MyApp.get "/" do
  @competitors = Competitor.all
  if @competitors == nil
    return nil
  else
  competitors = @competitors.limit(2).order("RANDOM()")
  @comp_1 = competitors[0].id
  @comp_2 = competitors[1].id
  @name_1 = competitors[0].name
  @name_2 = competitors[1].name
  @type = competitors[0].competitor_type
  end
  erb :"main/main"
end

MyApp.get "/thank_you" do
  erb :"main/thank_you"
end