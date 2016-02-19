MyApp.get "/categories" do

  erb :"/categories/view_categories"
end

MyApp.get "/categories/add" do
  @category = Category.new
  @nominees = Nominee.all
  erb :"/categories/add_category"
end

MyApp.post "/categories/add/confirmation" do
  @category = Category.new
  @nominees = Nominee.all
  @category.name = params[:add_name]
  @category.description = params[:category_description_textarea]
  @category.image = params[:add_category_image_link]
  @category.thumbnail = params[:add_category_thumbnail_link]
  @category.locked = false

  if Category.exists?(:name => params[:add_name])
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