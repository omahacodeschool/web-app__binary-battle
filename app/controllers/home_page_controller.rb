MyApp.get "/" do
  
  x = Battle.new
  x.run_battle

  @battle = x
  
  erb :"/home_page"
end

MyApp.post "/vote/a" do # "a" or "b"

@winner = "Scanners"
@loser = "Videodrome"

  erb :"/results"
end
  
MyApp.post "/vote/b" do # "a" or "b"

@winner = "Videodrome"
@loser = "Scanners"

  erb :"/results"
end