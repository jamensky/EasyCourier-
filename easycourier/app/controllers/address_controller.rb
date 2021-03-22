class AddressController < ApplicationController
  
  get '/addresses' do 
    all_addresses = Address.all 
      if all_addresses
        erb :'addresses/error'
      else 
        erb :'addresses/index'
      end 
  end 

  get '/addresses/new' do 
    get :'addresses/new'
  end 

  post '/addresses/new' do 
    binding.pry 
  end 

end 