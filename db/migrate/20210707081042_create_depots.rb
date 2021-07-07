class CreateDepots < ActiveRecord::Migration[5.2]
  def change
    create_table :depots do |t|
      t.string :name
      t.string :routes
      t.string :station
      t.integer :walking_stage

      t.timestamps
    end
  end
end
