MyApp.get "/" do
	@cat_1, @cat_2 = Cat.all.sample(2)
  erb :"home"
end

MyApp.post "/cat_like/:winner/:loser" do
	@winner = Cat.find(params[:winner])
	@loser = Cat.find(params[:loser])
	@winner.likes += 1
	@winner.save
  redirect :"like/#{@winner.id}/#{@loser.id}"
end

MyApp.get "/like/:winner/:loser" do
	@winner = Cat.find(params[:winner])
	@loser = Cat.find(params[:loser])
   erb :"like_added"
end

MyApp.get "/results" do
	cat_list = Cat.all
	@rank = cat_list.sort {|a,b| b.likes <=> a.likes}
  erb :"results"
end

MyApp.get "/admin" do
	@cat_list = Cat.ranking
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