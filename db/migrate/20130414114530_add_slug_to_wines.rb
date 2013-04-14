class AddSlugToWines < ActiveRecord::Migration
  def change
    add_column :wines, :slug, :string
    add_index :wines, :slug
  end
end
