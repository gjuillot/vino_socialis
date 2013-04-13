class AddSlugToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :slug, :string
    add_index :areas, :slug
  end
end
