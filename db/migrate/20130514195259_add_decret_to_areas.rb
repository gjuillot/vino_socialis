class AddDecretToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :decret_name, :string
    add_column :areas, :decret_link, :string
  end
end
