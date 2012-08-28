class CreateWineRackBottles < ActiveRecord::Migration
  def change
    create_table :wine_rack_bottles do |t|
      t.references :wine_rack
      t.references :bottle
      t.integer :row
      t.integer :column

      t.timestamps
    end
    add_index :wine_rack_bottles, :wine_rack_id
    add_index :wine_rack_bottles, :bottle_id
  end
end
