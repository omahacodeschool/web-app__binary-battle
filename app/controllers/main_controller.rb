MyApp.get "/" do

  @dworfs =User.limit(2).order("RANDOM()")
  erb :"home"
end
MyApp.get "/add_dworf" do
  dworf_add = Dworf.new
  dworf_add.name = params[:dworf_name]
  dworf_add.save
  erb :"administrator"
end
MyApp.get "/vote_dworf/:place" do
  @dworf_vote = Dworf.find_by_id(params[:place])
  @dworf_vote.vote = + 1
  @dworf_vote.save
  erb :"vote_follow"
end
