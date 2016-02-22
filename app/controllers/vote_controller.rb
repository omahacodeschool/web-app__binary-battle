# Homepage shows the form for voting for one of two bands
MyApp.get "/" do
  @band_1, @band_2 = Band.all.sample(2)

  erb :"home"
end


# Processes the voting form
MyApp.post "/voted/:w/:l" do 
  @result = Result.new
  @result.winner_id = params[:w]
  @result.loser_id = params[:l]
  @result.save

  erb :"voted"
end

