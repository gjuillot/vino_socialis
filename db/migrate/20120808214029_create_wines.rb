class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.references :estate
      t.references :area
      t.references :wine_color
      t.text :info
      t.references :user

      t.timestamps
    end
    add_index :wines, :estate_id
    add_index :wines, :area_id
    add_index :wines, :wine_color_id
    add_index :wines, :user_id
  end
end
