#WOULDNT IT BE NICE IF YOU COULD MAKE A BASIC CONTROLLER AND NOT HAVE IT BE BROKEN

MyApp.get "/" do
  @rubytext = "You can't even see this anyway"
  erb :"/home"
end