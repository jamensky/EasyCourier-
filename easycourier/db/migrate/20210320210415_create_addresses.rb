class CreateAddresses < ActiveRecord::Migration[5.2]
    def change
      create_table :addresses do |t|
        t.string :client_name 
        t.string :first_line_of_address
        t.string :post_code
        t.string :contact
        t.string :reference
        t.string :note 

        t.integer :route_id
      end 
    end 
end
