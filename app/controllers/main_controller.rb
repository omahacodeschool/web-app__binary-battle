
MyApp.get "/" do
  @competitor_with_photo = Competitor.find_by_id(7)
  erb :"welcome"
end

MyApp.get "/competitor/add" do
  erb :"competitor/add_competitor"
end

MyApp.post "/competitor/create" do
  competitor = Competitor.new
  competitor.name = params["competitor_name"]
  competitor.save
  @confirm_message = "Created #{competitor.name}!"
  erb :"confirm_submission"
end

MyApp.get "/competitor/vote" do
  competitors = Competitor.all
  @match_competitors = competitors.sample(2)
  #matchup = Matchup.new
  #Get two numbers randomly that are some combination possible out of 
  #all competitor ids
  #matchup.first_competitor_id = #first number of random matchup number
  #matchup.second_competitor_id = #second number of random matchup number
  #don't forget to write access_competitor method so you can display competitor
  #names on page
  erb :"competitor/vote"
end

MyApp.post "/vote/create" do
  matchup = Matchup.new
  matchup.winner_competitor_id = params["winner_id"]
  matchup.loser_competitor_id = params["loser_id"]
  matchup.save
  @confirm_message = "Successfully voted for #{matchup.winner_name} over #{matchup.loser_name}!"
  erb :"confirm_submission"
end





