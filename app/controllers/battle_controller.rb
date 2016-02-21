MyApp.get "/" do
  
  x = Battle.new
  x.run_battle

  @battle = x
  
  erb :"/home_page"
end

MyApp.post "/vote/:winner/:loser" do # "a" or "b"

@winner = params[:winner]
@loser =  params[:loser]

  erb :"/results"
end
