MyApp.get "/add_category_form" do 
  erb :"user/add_category_form"
end

MyApp.post "/add_category" do 
  @category = Category.new
  @category.category_title = params["category_title"]
  @category.save
  @num_of_nominees = params["number_of_nominees"]
  erb :"user/add_nominees_form"
end

