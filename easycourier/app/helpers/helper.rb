class Helper < ActiveRecord::Base

  def self.validate_user(user)
    @user = Courier.find_by(user_name: user[:user_name])
  end 


end 