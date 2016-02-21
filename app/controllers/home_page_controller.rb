MyApp.get "/" do
  
  x = Battle.new
  x.run_battle

  @battle = x
  
  erb :"/home_page"
end

MyApp.post "/vote/:winner" do # "a" or "b"

@winner = params[:winner]
#@loser = 

  erb :"/results"
end
