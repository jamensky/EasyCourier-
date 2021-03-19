class CreateCourierTable < ActiveRecord::Migration[5.2]
  def change
    create_table :couriers do |t|
      t.string :name
      t.string :keys_number
    end
  end
end




