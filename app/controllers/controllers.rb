MyApp.get "/" do

  erb :"home_page"
end

MyApp.get "/submit_vote" do

  erb :"vote_successful_page"
end

MyApp.get "/view_rankings" do

  erb :"rankings_page"
end

