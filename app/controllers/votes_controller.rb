MyApp.get "/" do
  
  erb :"user/ballot_box"
end

MyApp.get "/result" do

  erb :"user/result"
end