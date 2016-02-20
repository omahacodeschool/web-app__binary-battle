MyApp.post "/vote_added/:winner/:loser" do
  @winner = Legend.find(params[:winner])
  @loser = Legend.find(params[:loser])
  @vote = Vote.new
  @vote.winner_id = @winner.id
  @vote.loser_id = @loser.id
  # @vote.order = params[:order]
  @vote.save
  # binding.pry
  # redirect :"vote_added/#{@winner_id}/#{@loser_id}"
  erb :"votes/vote_added"
end

# MyApp.get "/votes/:winner/:loser" do
#   @winner = Legend.find(params[:winner])
#   @loser = Legend.find(params[:loser])
#   erb :"votes/vote_added"  
# end

MyApp.get "/results" do
  erb :"votes/results"
end

