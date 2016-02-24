MyApp.post "/user_vote" do
  @votes = Vote.all
  @vote  = Vote.new

  @vote.upvote_id   = (params["upvote_id"])
  @vote.downvote_id = (params["downvote_id"])
  @vote.vote_button = (params["vote_button"].to_i)
  @vote.save

  @upvote   = Movie.find_by_id(params["upvote_id"])
  @downvote = Movie.find_by_id(params["downvote_id"])

  erb :"user/vote_result"
end

MyApp.get "/vote_record" do
  @votes  = Vote.all
  @movies = Movie.all

  erb :"user/vote_record"
end