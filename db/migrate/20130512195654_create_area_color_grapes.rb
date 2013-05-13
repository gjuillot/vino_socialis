class CreateAreaColorGrapes < ActiveRecord::Migration
  def change
    create_table :area_color_grapes do |t|
      t.references :area
      t.string :color
      t.references :grape_variety

      t.timestamps
    end
    add_index :area_color_grapes, :area_id
    add_index :area_color_grapes, :grape_variety_id
  end
end
