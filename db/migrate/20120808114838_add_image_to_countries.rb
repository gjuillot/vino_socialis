class AddImageToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :image_url, :string
    add_column :countries, :image_link, :string
    add_column :countries, :image_source, :string
  end
end
