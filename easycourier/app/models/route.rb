class Route < ActiveRecord::Base 
   
    has_many :couriers_routes
    has_many :couriers, through: :couriers_routes

end 