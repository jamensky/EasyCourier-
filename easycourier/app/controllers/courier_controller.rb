class CourierController < ApplicationController
         
     
        get '/couriers' do 
          @couriers = Courier.all 
            if @couriers.empty? 
              erb :'couriers/error'
            else 
              erb :'couriers/index'
            end 
        end 
      
        get '/couriers/new' do 
          erb :'couriers/new'
        end 
      
        post '/couriers/new' do 
          @courier = Courier.create(params)
          erb :'couriers/show'
        end 
      
        get '/couriers/:id' do
          @courier = Courier.find_by_id(params[:id])
          erb :'couriers/show'
        end
      
        get '/couriers/:id/edit' do 
           @courier = Courier.find_by_id(params[:id])
           erb :'couriers/edit'
        end 
      
        patch '/couriers/:id' do 
           @courier = Courier.find_by_id(params[:id])
             @courier.user_name = params[:user_name]
             @courier.keys_number = params[:keys_number]
      
          @courier.save
          
          redirect "/couriers/#{params[:id]}"
        end
      
        delete 'couriers/:id' do 
           @courier = Courier.find_by_id(params[:id])
           #@courier.clear
        end 
      
end 