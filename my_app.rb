require 'sinatra/base'


class MyApp < Sinatra::Base

  get '/' do 
    "It Works!"
  end
  
  get '/puma-test' do 
    "Making sure that it works :)"
  end


  run! if $0 == __FILE__
end
