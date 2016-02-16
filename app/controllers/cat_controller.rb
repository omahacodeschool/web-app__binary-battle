MyApp.get "/" do
	@cat_list = Cat.all
  erb :"home"
end

MyApp.get "/admin" do
	@cat_list = Cat.all
  erb :"admin"
end

MyApp.post "/add_cat" do
	@cat =  Cat.new
	@cat.name = params[:name]
	@cat.votes = 0
	@cat.save
  redirect :"admin"
end