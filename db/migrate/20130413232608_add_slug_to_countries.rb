class AddSlugToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :slug, :string
    add_index :countries, :slug
  end
end
