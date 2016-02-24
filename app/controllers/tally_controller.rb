#Shows the scores for each artist
MyApp.get "/tally" do 
  @bands = Band.band_ranks
  @results = Result.all

  erb :"tally"
end
