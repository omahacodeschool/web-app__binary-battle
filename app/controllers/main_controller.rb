# controller for primary action of binary battle
MyApp.get "/" do 
  erb :"main" 
end

MyApp.get "/trash" do
  erb :"trash"
end