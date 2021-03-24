require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    secret = SecureRandom.base64(12)
    enable :sessions 
    set :session_secret, secret
  end
 

  get '/' do
    erb :"application/login"
  end
  
  get '/application/app_index' do 
    erb :'application/app_index'
  end 

  post '/login' do
    @user = Courier.find_by(user_name: params[:user_name])

    if @user && @user.authenticate(params[:password])
      redirect "/couriers/#{@user.id}"
    else
      erb :'/application/error'
    end 
  end 

  
  get '/sign_up' do 
    erb :'/application/sign_up'
  end  

  
  post '/sign_up' do
    @user = Courier.new(params)

    if @user.save
      redirect "/"
    else 
      erb :'application/error'
    end 
  end 

  post '/route_to' do #session user_id gets lost at this point
      redirect "/#{params.keys[0]}"
  end 

  get '/logout' do
    session.clear
    redirect '/'
  end
 
end


