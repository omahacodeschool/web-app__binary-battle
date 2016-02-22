MyApp.get "/legends" do
  @legend = Legend.all
  erb :"legends/legends"
end

MyApp.get "/edit_legend/:number" do
  @legend = Legend.find_by_id(params[:number])
  erb :"legends/edit_legend"
end

MyApp.post "/edit_legend/success/:number" do
  @legend = Legend.find_by_id(params[:number])
  @legend.name = params["name"]
  @legend.save
  erb :"legends/edit_legend_success"
end

MyApp.get "/add_legend" do
  erb :"legends/add_legend"
end

MyApp.post "/add_legend/success" do
  x = Legend.new
  # x.name is a new Active Record method that sets an Legend Object attribute name to "name".
  x.name = params["name"]
  # x.save should be a new Active Record method that saves that Legend Object to the "legends" table. 
  x.save
  # binding.pry # what is 'x'?
  erb :"legends/add_legend_success"
end