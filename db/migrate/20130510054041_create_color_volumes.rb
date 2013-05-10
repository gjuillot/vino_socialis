class CreateColorVolumes < ActiveRecord::Migration
  def change
    create_table :color_volumes do |t|
      t.references :region
      t.references :area
      t.string :year
      t.decimal :volume
      t.string :color

      t.timestamps
    end
    add_index :color_volumes, :region_id
    add_index :color_volumes, :area_id
  end
end
