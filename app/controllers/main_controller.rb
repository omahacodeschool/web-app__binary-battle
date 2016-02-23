MyApp.get "/" do
  @category = Category.where({"locked" => false})
  erb :"/main"
end

MyApp.get "/admin/admin_tools" do
  @categories = Category.all
  @nominees = Nominee.all
  @pools = Pool.all
  @results = Result.all
  erb :"/admin/admin_tools"
end

MyApp.post "/admin/admin_tools/category/locked/confirmation" do
  @category = Category.find_by_id(params[:lock_category_dropdown])
  @category.locked = true
  @category.save
  redirect :"/admin/admin_tools"
end

MyApp.post "/admin/admin_tools/nominee/locked/confirmation" do
  @nominee = Nominee.find_by_id(params[:lock_nominees_dropdown])
  @nominee.locked = true
  @nominee.save
  redirect :"/admin/admin_tools"
end