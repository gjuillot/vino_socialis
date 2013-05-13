class AddGeologyToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :geology, :string
  end
end
