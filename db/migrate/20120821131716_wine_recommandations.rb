class WineRecommandations < ActiveRecord::Migration
  def change
    create_table :wine_recommandations do |t|
      t.references :user
      t.references :wine

      t.timestamps
    end
    add_index :wine_recommandations, :user_id
    add_index :wine_recommandations, :wine_id
  end
end
