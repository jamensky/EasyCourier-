class CreateCouriers < ActiveRecord::Migration[5.2]
  def change
    create_table :couriers do |t|
      t.string :user_name
      t.string :password
      t.string :keys_number
    end 
  end
end
