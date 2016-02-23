
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
  erb :"competitor/vote"
end

MyApp.post "/vote/create/:winner_id/:loser_id" do
  winner_id = params[:winner_id]
  loser_id = params[:loser_id]
  matchup = Matchup.new
  matchup.winner_competitor_id = winner_id
  matchup.loser_competitor_id = loser_id
  matchup.save
  @confirm_message = "Successfully voted for #{matchup.winner_name} over #{matchup.loser_name}!"
  erb :"confirm_submission"
end

MyApp.get "/vote/view" do
  @rankings_hash = Competitor.rank
  @competitors = Competitor.all
  all_matchups = Matchup.all
  @matchups = all_matchups.order("winner_competitor_id", "loser_competitor_id")
  erb :"competitor/view_votes"
end

MyApp.get "/matchups/:competitor_id" do
  @competitor = Competitor.find_by_id(params[:competitor_id])
  @matchups = @competitor.get_competitors_faceoffs
  @competitors_matchups = @competitor.get_opponents_matchups
  erb :"competitor/single_competitors_matchups"
end





