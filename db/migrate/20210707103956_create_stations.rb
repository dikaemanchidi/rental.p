class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :line
      t.string :station
      t.integer :time

      t.timestamps
    end
  end
end
