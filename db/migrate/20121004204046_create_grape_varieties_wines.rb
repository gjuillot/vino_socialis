class CreateGrapeVarietiesWines < ActiveRecord::Migration
  def change
    create_table :grape_varieties_wines, :id => false do |t|
      t.integer :wine_id
      t.integer :grape_variety_id
    end
  end
end
