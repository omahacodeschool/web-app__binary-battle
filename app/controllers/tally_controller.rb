#Shows the scores for each artist
MyApp.get "/tally" do 
  @bands = Band.all
  @results = Result.all

  erb :"tally"
end
