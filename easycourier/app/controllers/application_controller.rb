require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    secret = SecureRandom.base64(12)
    set :session_secret, secret
  end
 
  get '/' do
    erb :"application/login"
  end

  get '/login' do 
    if params[:password].empty? || params[:user_name].empty?
      erb :'/application/error'
    else 
      @user = Courier.find_by_id(params[:id])
      session[:id] = @user.id 
      redirect "/couriers/#{@user.id}"
    end 
  end 

  get '/sign_up' do 
    erb :'/application/sign_up'
  end  

  post '/sign_up' do 
    @user = Courier.new(params)
    @user.save
      session[:id] = @user.id 
    erb :'application/app_index'
  end 

  post '/route_to' do 
      redirect "/#{params.keys[0]}"
  end 

  get '/logout' do
    session.clear
    redirect '/'
  end
 
end


