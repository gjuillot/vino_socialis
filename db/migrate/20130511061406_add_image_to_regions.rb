class AddImageToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :image_url, :string
    add_column :regions, :image_source, :string
    add_column :regions, :image_link, :string
  end
end
