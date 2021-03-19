class CreateCouriersRoutesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :couriers_routes do |t|
      t.integer :courier_id
      t.integer :route_id 
    end 
  end
end
