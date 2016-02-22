MyApp.get "/nominees" do
  @nominees = Nominee.all
  erb :"/nominees/view_nominees"
end

MyApp.get "/nominees/add" do
  @nominee = Nominee.new
  @categories = Category.all
  erb :"/nominees/add_nominee"
end

MyApp.post "/nominees/add/confirmation" do
  @nominee = Nominee.new
  @category = Category.all
  @nominee.name = params[:add_nominee_name_textbox]
  @nominee.bio = params[:nominee_bio_textarea]
  @nominee.image = params[:add_nominee_image_link]
  @nominee.thumbnail = params[:add_nominee_thumbnail_link]
  @nominee.confirmed = params[:confirmed_radio]
  @nominee.locked = false
 
 if Nominee.exists?(:name => params[:add_nominee_name_textbox]) && @nominee.confirmed != true
    @duplicate_nominee_warning = true
    erb :"/nominees/add_nominee"
  else
    @nominee.save
    params[:checkbox_categories].each do |category|
      if category != nil
        @pool = Pool.new 
        @pool.nominee_id = @nominee.id
        @pool.category_id = category
        @pool.save
      end
    end
    redirect :"/nominees/nominee/#{@nominee.id}"
  end
end

MyApp.post "/nominees/nominee/:id/delete" do
  @nominee = Nominee.find_by_id(params[:id])

  redirect :"/nominees"
end

MyApp.get "/nominees/nominee/:id" do
  @nominee = Nominee.find_by_id(params[:id])
  @pool = Pool.where({"nominee_id" => params[:id]})
  erb :"/nominees/view_nominee"
end

MyApp.get "/nominees/nominee/:id/update" do
  @nominee = Nominee.find_by_id(params[:id])

  erb :"/nominees/update_nominee"
end

MyApp.post "/nominees/nominee/:id/update/confirmation" do
  @nominee = Nominee.find_by_id(params[:id])

  redirect :"/nominees/nominee/#{@nominee_id}"
end