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
    
    if params[:password].empty? || params[:user_name].empty? || !params[:password] == @user.password
      erb :'/application/error'
    elsif @user
      session[:user_id] = @user.id 
      erb :"/application/app_index"
    else 
      erb :'/application/error'
    end 
  end 


  get '/sign_up' do 
    erb :'/application/sign_up'
  end  

  
  post '/sign_up' do
    if params[:password].empty? || params[:user_name].empty?
      erb :'application/sign_up'
    else 
      @user = Courier.new(params)
      @user.save
      session[:user_id] = @user.id

      erb :'application/app_index'
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


