MyApp.get "/categories" do

  erb :"/categories/view_categories"
end

MyApp.get "/categories/add" do
  @message = Category.all
  @nominees = Nominee.all
  erb :"/categories/add_category"
end

MyApp.post "/categories/add/confirmation" do
  @message = Category.all
  @category = Category.new
  @nominees = Nominee.all
  @category.name = params[:add_name]
  @category.locked = false

  if Category.exists?(:name => params[:add_name]) ## EVENTUALLY INCLUDE METHOD TO CHECK IF POOL (WITH CATEGORY ID) IS LOCKED
    @error = true
    erb :"/categories/add_category"
  else
    @category.save
    redirect :"/categories/category/#{@category.id}"
  end
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