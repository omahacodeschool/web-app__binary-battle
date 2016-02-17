MyApp.get "/" do
  erb :"homepage"
end
#Go to View to add movies
MyApp.get "/new_movie" do
  erb :"create_movie"
end