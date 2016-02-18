# This controller action collects the the user votes and places the results accordingly
MyApp.post "/user_vote" do
  @votes = Vote.all
  @vote  = Vote.new

  @vote.upvote_id   = 
  @vote.downvote_id =
  @vote.save

  erb :"user/result"
end

MyApp.get "/result" do


  erb :"user/result"
end