MyApp.get "/" do
  erb :"home_page"
end

MyApp.get "/submit_vote" do
  @dwarf = Score.find_by_dwarf_name("Dopey")
  @dwarf.tally += 1
  @dwarf.save
  erb :"vote_successful_page"
end

MyApp.get "/view_rankings" do
  @whole_table = Score.all
  erb :"rankings_page"
end

