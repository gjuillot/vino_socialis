class CreateTastings < ActiveRecord::Migration
  def change
    create_table :tastings do |t|
      t.references :user
      t.references :wine
      t.integer :vintage
      t.date :date
      t.integer :note

      t.timestamps
    end
    add_index :tastings, :user_id
    add_index :tastings, :wine_id
  end
end
