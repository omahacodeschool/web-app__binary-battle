# This controller action collects the the user votes and places the results accordingly
# How will it know what the other option is that wasn't selected?
MyApp.post "/user_vote" do
  @votes = Vote.all
  @vote  = Vote.new

  @vote.upvote_id   = (params["upvote_id"])
  @vote.downvote_id = (params["downvote_id"])
  @vote.save

  erb :"user/vote_result"
end

MyApp.get "/vote_result" do


  erb :"user/result"
end