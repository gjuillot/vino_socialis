class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.references :wine
      t.boolean :validation
      t.string :image

      t.timestamps
    end
    add_index :labels, :wine_id
  end
end
