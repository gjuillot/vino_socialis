class AddSlugToEstates < ActiveRecord::Migration
  def change
    add_column :estates, :slug, :string
    add_index :estates, :slug
  end
end
