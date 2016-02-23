MyApp.get "/vote" do
  @table = Dwarf.all
  @dwarf = @table.sample(2)
  erb :"vote_page"
end

MyApp.get "/submit_vote/:dwarf_selection/:dwarf_loser" do
  @dwarf = Dwarf.find_by_id(params[:dwarf_selection])
  @dwarf.tally += 1
  @dwarf.save
  @match = Match.new
  @match.winner = @dwarf.id 
  @match.loser = params[:dwarf_loser]
  @match.save
  erb :"vote_successful_page"
end

MyApp.get "/view_rankings" do
  @all_scores = Dwarf.all
  @ordered_table = @all_scores.order(:tally)
  erb :"rankings_page"
end

MyApp.get "/" do
  erb :"add_dwarf_form"
end

MyApp.get "/submit_dwarf_form" do
  @new_dwarf = Dwarf.new
  @new_dwarf.name = params[:dwarf_name]
  @new_dwarf.tally = 0
    if @new_dwarf.is_valid == true
      @new_dwarf.save
      erb :"dwarf_was_added"
    else
      erb :"error"
    end
end
