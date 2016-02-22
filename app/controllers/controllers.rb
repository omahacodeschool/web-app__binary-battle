MyApp.get "/" do
  @table = Score.all
  @dwarf = @table.sample(2)
  erb :"home_page"
end

MyApp.get "/submit_vote/:dwarf_selection" do
  binding.pry
  @dwarf = Score.find_by_id(params[:dwarf_selection])
  @dwarf.tally += 1
  @dwarf.save
  erb :"vote_successful_page"
end

MyApp.get "/view_rankings" do
  @whole_table = Score.all
  erb :"rankings_page"
end

