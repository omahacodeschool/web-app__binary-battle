MyApp.get "/" do

  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and send the
  # combined document back to the client.
  #
  # "Results" is the display of cumulative game results.
  #
  # 



  #
  erb :"results" 
end