class CreateDepots < ActiveRecord::Migration[5.2]
  def change
    create_table :depots do |t|
      t.string :route
      t.string :station
      t.integer :walking_distance
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
