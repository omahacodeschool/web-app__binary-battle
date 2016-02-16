MyApp.get "/" do
	@cat_1, @cat_2 = Cat.all.sample(2)
  erb :"home"
end

MyApp.post "/cat_like/:winner/:loser>" do
	@winner = Cat.find(params[:winner])
	@loser = Cat.find(params[:loser])
	@cat.likes += 1
	@cat.save
  erb :"like_added/#{@winner.id}/#{@loser.id}"
end

MyApp.get "/like_added/:winner/:loser" do
	@winner = Cat.find(params[:winner])
	@loser = Cat.find(params[:loser])
end

MyApp.get "/admin" do
	@cat_list = Cat.all
  erb :"admin"
end

MyApp.post "/add_cat" do
	@cat = Cat.new
	@cat.name = params[:name]
	@cat.likes = 0
	@cat.save
  redirect :"admin"
end

MyApp.post "/cat_delete/:cat_id" do
	@cat = Cat.find(params[:cat_id])
	@cat.delete
  redirect :"admin"
end