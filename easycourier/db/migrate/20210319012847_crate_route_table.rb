class CrateRouteTable < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :day 
    end
  end
end
