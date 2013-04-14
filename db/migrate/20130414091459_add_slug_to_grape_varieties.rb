class AddSlugToGrapeVarieties < ActiveRecord::Migration
  def change
    add_column :grape_varieties, :slug, :string
    add_index :grape_varieties, :slug
  end
end
