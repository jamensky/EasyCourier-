class Courier < ActiveRecord::Base
    
    has_many :couriers_routes
    has_many :routes, through: :couriers_routes 

end 