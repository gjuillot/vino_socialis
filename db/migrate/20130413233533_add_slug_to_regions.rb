class AddSlugToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :slug, :string
    add_index :regions, :slug
  end
end
