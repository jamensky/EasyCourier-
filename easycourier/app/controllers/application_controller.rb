require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :"application/app_index"
  end

  post '/route_to' do 
    if params.keys[0] == "couriers"
      redirect "couriers/index"
    end 
  end 
 
end
