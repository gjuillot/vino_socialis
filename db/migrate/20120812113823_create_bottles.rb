class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.references :user
      t.references :wine
      t.integer :vintage
      t.string :volume
      t.integer :quantity
      t.date :date
      t.string :channel
      t.decimal :price, precision: 5, scale: 2
      t.string :comments

      t.timestamps
    end
    add_index :bottles, :wine_id
  end
end
