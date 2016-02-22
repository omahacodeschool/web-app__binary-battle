MyApp.get "/" do

  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.
  #
  # "Main" is the gameplay page in this program. 

  @game = Quarterback.new
  @game.choose_quarterback[1]
  @game.choose_quarterback[2]
  #then a miracle happens


  #
  erb :"main" 
end


MyApp.get "/quarterback/create" do

  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.

  # Accepts the form entry data and creates the college in the table. 

  quarterbacks = Quarterback.new
  quarterbacks.quarterback_name = params[:quarterback_name]
  quarterbacks.claim_to_fame = params[:claim_to_fame]
  quarterbacks.save


  erb :"success quarterback add"
end

