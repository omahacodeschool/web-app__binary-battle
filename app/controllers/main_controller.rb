MyApp.get "/"  do
  @legends = Legend.random
  erb :"homepage"
end
