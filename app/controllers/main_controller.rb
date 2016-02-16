MyApp.get "/" do
	@cat_1, @cat_2 = Cat.all.sample(2)
  erb :"home"
end

MyApp.post "/cat_like/:winner/:loser" do
	@winner = Cat.find(params[:winner])
	@loser = Cat.find(params[:loser])
	@result = Result.new
	@result.winner_id = @winner.id
	@result.loser_id = @loser.id
	@result.save
  redirect :"like/#{@winner.id}/#{@loser.id}"
end

MyApp.get "/like/:winner/:loser" do
	@winner = Cat.find(params[:winner])
	@loser = Cat.find(params[:loser])
   erb :"like_added"
end

MyApp.get "/results" do
	cat_list = Cat.all
	@ranked_list = cat_list.rank_cats
  erb :"results"
end

MyApp.get "/admin" do
	@cat_list = Cat.all
  erb :"admin"
end

MyApp.post "/add_cat" do
	@new_cat = Cat.create({name: params['name'], photo: params['photo']})
  redirect :"admin"
end

MyApp.post "/cat_delete/:cat_id" do
	@cat = Cat.find(params[:cat_id])
	@cat.delete
  redirect :"admin"
end