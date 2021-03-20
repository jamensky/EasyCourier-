class CourriersRoute < ActiveRecord::Base 
   
    has_many :couriers_id
    has_many :routes_id

end 