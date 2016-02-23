MyApp.get "/battles" do
  @category = Category.all

  erb :"/battles/view_battles"
end

MyApp.post "/battles/battle/select" do
  @nominees = Nominee.all
  if params[:category_battle_selection_dropdown].empty?
    @no_id_error = true
    erb :"main_errors"
  else
    @category = Category.find_by_id(params[:category_battle_selection_dropdown])
    @check_pool = @category.check_pool_size
      if @check_pool == true
         @error = true
         redirect :"/battles/battle/#{@category.id}/add_more_nominees"
      end
   redirect :"/battles/battle/#{@category.id}/play"
  end
end


MyApp.get "/battles/battle/:id/play" do
  @nominee_ids =[]
  @category = Category.find_by_id(params[:id])
  @check_pool = @category.check_pool_size
  if @check_pool == true
     @error = true
      erb :"categories/add_category_nominees"
  else
    @pool = @category.get_sample
    @pool.each do |id|
      if id != nil
       @nominee_ids << id.nominee_id.to_i
      end
    end
    erb :"/battles/view_battle"
  end
end

MyApp.get "/battles/battle/:id/add_more_nominees" do
  @category = Category.find_by_id(params[:id])
  @pool_nominees = @category.get_pool_nominees_array
  if @pool_nominees.empty?
    @nominees = Nominee.all
  else
    @nominees = Nominee.where.not({"id" => @pool_nominees})
  end
  erb :"categories/add_category_nominees"
end

MyApp.post "/battles/battle/:id/add_more_nominees/confirmation" do
  @category = Category.find_by_id(params[:id])
  @pool_nominees = @category.get_pool_nominees_array
  @pool = Pool.where({"category_id" => @category.id})

    if params[:checkbox_nominees] == nil || @pool.length <= 1 
      redirect :"/battles/battle/#{@category.id}/add_more_nominees"
    elsif params[:checkbox_nominees].length >= 2
       params[:checkbox_nominees].each do |nominee|
        if nominee != nil
          @pool = Pool.new 
          @pool.nominee_id = nominee
          @pool.category_id = @category.id
          @pool.save
        end
      end
    end
    redirect :"/battles/battle/#{@category.id}/play"
end




MyApp.post "/battles/battle/:id/cast_vote" do
  @category = Category.find_by_id(params[:id])
  @nominees_results = Result.new
  @nominees_results.loved_id = params[:battle_selection_radio]
 params[:nominee_ids].each do |loser|
    if loser != params[:battle_selection_radio]
      @nominees_results.lost_id = loser
      break
    end
  end
  @nominees_results.category_id = @category.id
  @nominees_results.locked = true
  @winner = Nominee.find_by_id(@nominees_results.loved_id)
  @loser = Nominee.find_by_id(@nominees_results.lost_id)
  @nominees_results.save
  erb :"/battles/view_battle_confirmation"
end
