class ChangeColorColumnForWines < ActiveRecord::Migration
  def up
    change_table :wines do |t|
      t.remove :wine_color_id
      t.string :wine_color
    end
    drop_table :wine_colors
  end

  def down
    create_table :wine_colors do |t|
      t.string :name
      t.timestamps
    end
    change_table :wines do |t|
      t.remove :wine_color
      t.references :wine_color
    end
  end
end
