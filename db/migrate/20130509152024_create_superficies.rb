class CreateSuperficies < ActiveRecord::Migration
  def change
    create_table :superficies do |t|
      t.references :region
      t.references :area
      t.string :year
      t.integer :superficy
      t.string :source
    end
    add_index :superficies, :region_id
    add_index :superficies, :area_id
  end
end
