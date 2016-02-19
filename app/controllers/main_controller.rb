MyApp.get "/" do
  
  @dworf1, @dworf2 = Dworf.limit(2).order("RANDOM()")

  erb :"home"
end
MyApp.get "/add_dworf" do
  @dworf_add = Dworf.new
  @dworf_add.name = params[:dworf_name]
  @dworf_add.image = params[:dworf_pic]
  @dworf_add.vote = 1
  @dworf_add.save
  erb :"administrator"
end
MyApp.get "/vote_dworf/:place/:holder" do
  @dworf = Dworf.find_by_id(params[:place])
  @result = Result.new
  @result.win = params[:place]
  @result.loose = params[:holder]
  @dworf.vote = @dworf.vote + 1
  @dworf.save
  @result.save
  erb :"vote_follow"
end
MyApp.get "/administrator" do
  erb :"administrator"
end
MyApp.get "/results" do

  @dworfs = Dworf.all                   
  @result = Result.all                #
  @result.win = @win                  #taking the win column in result as var
  @win.mode = @winner                 #setting the mode on the column to a var
  erb :"results"
end