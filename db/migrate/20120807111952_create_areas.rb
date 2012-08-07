class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.references :region

      t.timestamps
    end
    add_index :areas, :region_id
  end
end
