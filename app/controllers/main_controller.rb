MyApp.get "/" do
  @dworfs = Dworf.limit(2).order("RANDOM()")
  erb :"home"
end
MyApp.get "/add_dworf" do
  @dworf_add = Dworf.new
  @dworf_add.name = params[:dworf_name]
  @dworf_add.save
  erb :"administrator"
end
MyApp.get "/vote_dworf/:place" do
  @dworf = Dworf.find_by_id(params[:place])
  @dworf.vote 
  erb :"vote_follow"
end
MyApp.get "/administrator" do
  erb :"administrator"
end
MyApp.get "/vote_dworf/results" do
  @dworfs = Dworf.all
  erb :"results"
end
