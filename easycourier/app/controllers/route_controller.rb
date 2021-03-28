class RouteController < ApplicationController
  
        get '/routes' do 
          @routes = Route.all 
            if @routes.empty? 
              erb :'routes/error'
            else 
              erb :'routes/index'
            end 
        end 
      
        get '/routes/new' do 
          erb :'routes/new'
        end 
      
        post '/routes/new' do 
          @route = Route.create(params)
          erb :'routes/show'
        end 
      
        get '/routes/:id' do
          @route = Route.find_by_id(params[:id])
          erb :'routes/show'
        end
      
        get '/routes/:id/edit' do 
           @route = Route.find_by_id(params[:id])
           erb :'routes/edit'
        end 
      
        patch '/routes/:id' do 
           @route = Route.find_by_id(params[:id])
             @route.name = params[:name]
             @route.day = params[:day]
             @route.addresses << Address.find_by_id(params[:address_id])
             @route.save
          
          redirect "/routes/#{params[:id]}"
        end
      
        delete 'routes/:id' do 
           @route = Route.find_by_id(params[:id])
           @route.delete
       
           redirect '/routes'
        end 
      
end 
   
