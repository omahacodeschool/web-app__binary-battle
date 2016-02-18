MyApp.get "/categories" do

  erb :"/categories/view_categories"
end

MyApp.get "/categories/add" do

  erb :"/categories/add_categories"
end

MyApp.post "/categories/add/confirmation" do
  @category = Category.New

  redirect :"/categories/categories/category/#{@category_id}"
end

MyApp.post "/categories/category/:id/delete" do
  @category = Category.find_by_id(params[:id])

  redirect :"/categories"
end

MyApp.get "/categories/category/:id" do
  @category = Category.find_by_id(params[:id])

  erb :"/categories/view_category"
end

MyApp.get "/categories/category/:id/update" do
  @category = Category.find_by_id(params[:id])

  erb :"/categories/update_category"
end

MyApp.post "/categories/category/:id/update/confirmation" do
  @category = Category.find_by_id(params[:id])

  redirect :"/categories/category/#{@category_id}"
end