#Shows the scores for each artist
MyApp.get "/tally" do 
  @results = Result.all

  erb :"tally"
end
