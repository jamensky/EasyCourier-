
class Route < ActiveRecord::Base 
    has_many :addresses
    belongs_to :courier
end 