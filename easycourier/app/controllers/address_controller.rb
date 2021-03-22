class AddressController < ApplicationController
  
  post '/addresses' do 
    @all_addresses = Address.all 
    
  end 
  
end 