class DropWineRecommandations < ActiveRecord::Migration
  def up
    drop_table :wine_recommandations
  end

  def down
    create_table :wine_recommandations do |t|
      t.references :user
      t.references :wine

      t.timestamps
    end
    add_index :wine_recommandations, :user_id
    add_index :wine_recommandations, :wine_id
  end
end
