class AddressController < ApplicationController
  
  get '/addresses' do 
    @all_addresses = Address.all 
      if @all_addresses.empty? 
        erb :'addresses/error'
      else 
        erb :'addresses/index'
      end 
  end 

  get '/addresses/new' do 
    erb :'addresses/new'
  end 

  post '/addresses/new' do 
    @address = Address.create(params)

#binding.pry 

    erb :'addresses/show'
  end 

  get '/addresses/:id' do
    @address = Address.find_by_id(params[:id])
    erb :'addresses/show'
  end

  get '/addresses/:id/edit' do 
     @address = Address.find_by_id(params[:id])
     erb :'addresses/edit'
  end 

  patch '/addresses/:id' do 
     @address_to_edit = Address.find_by_id(params[:id])
       @address_to_edit.client_name = params[:client_name]
       @address_to_edit.first_line_of_address = params[:first_line_of_address]
       @address_to_edit.post_code = params[:post_code]
       @address_to_edit.contact = params[:contact]
       @address_to_edit.reference = params[:reference]
       @address_to_edit.note = params[:note]

    @address_to_edit.save
    #inding.pry
    
    redirect "/addresses/#{params[:id]}"
  end

  delete 'addresses/:id' do 
     @address = Address.find_by_id(params[:id])
     #@address_to_delete.clear
  end 

end 