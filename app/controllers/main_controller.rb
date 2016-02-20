MyApp.get "/"  do
  # @legends = Legend.random
  @legend_1, @legend_2 = Legend.all.sample(2)
  erb :"homepage"
end
