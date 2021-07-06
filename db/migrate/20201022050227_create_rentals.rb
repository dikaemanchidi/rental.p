class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :name
      t.integer :rent
      t.string :address
      t.integer :age
      t.text :feedback

      t.timestamps
    end
  end
end
