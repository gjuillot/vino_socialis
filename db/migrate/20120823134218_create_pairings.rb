class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.references :tasting
      t.string :dish
      t.integer :note

      t.timestamps
    end
    add_index :pairings, :tasting_id
  end
end
