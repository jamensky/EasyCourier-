
class Courier < ActiveRecord::Base
    has_many :routes
    has_secure_password
end 