class CreateWineRacks < ActiveRecord::Migration
  def change
    create_table :wine_racks do |t|
      t.references :user
      t.string :name
      t.integer :rows
      t.integer :columns

      t.timestamps
    end
    add_index :wine_racks, :user_id
  end
end
