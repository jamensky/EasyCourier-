class AddressController < ActiveRecord::Base 

  get '/addresses/index' do 
    @all_addresses = Adress.all
    erb 'addresses/index'
  end 

end 