class Helper < ActiveRecord::Base

  def find_user(user)
    Courier.find_by_id(user.id)
  end 


  

end 