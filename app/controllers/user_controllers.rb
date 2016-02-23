MyApp.get "/add_category_form" do 
  erb :"user/add_category_form"
end

MyApp.post "/add_category" do
  @category = Category.new
  @category.category_title = params["category_title"]
  @category.save
  @num_of_nominees = params["number_of_nominees"]
  @categories = Category.all
  @count = 1
  erb :"user/add_nominees_form"
end

MyApp.post "/add_nominees" do 
  @nominee = Nominee.new
  repeat =  (params.length / 2)
  i = 1
  repeat.times do |i|
    @nominee.category_id = params["category"]
    @nominee.nominee = params["nominee_#{i}"]
    @nominee.nominee_image = params["nominee#{i}_image"]
    @nominee.save
    i += 1
  end
  binding.pry
end
