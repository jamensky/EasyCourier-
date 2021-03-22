class Helper < ActiveRecord::Base

  def check_route(route)
    if route == "couriers"
        true
    elsif route == "addresses"
        true 
    elsif route == "routes"
        true 
    end 
  end

end 