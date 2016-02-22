MyApp.get "/" do 
  @categories = Category.all
  erb :"homepage"
end