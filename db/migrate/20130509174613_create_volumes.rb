class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.references :region
      t.references :area
      t.string :year
      t.integer :volume
      t.string :source

      t.timestamps
    end
    add_index :volumes, :region_id
    add_index :volumes, :area_id
  end
end
