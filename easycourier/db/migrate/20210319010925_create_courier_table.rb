class CreateCourierTable < ActiveRecord::Migration[5.2]
  def change
    create_table :courries do |t|
      t.string :name
      t.string :keys_number
    end
  end
end


courriers has many routes and many addresses through routes 

addresses belong to courrier 

routes has many add


