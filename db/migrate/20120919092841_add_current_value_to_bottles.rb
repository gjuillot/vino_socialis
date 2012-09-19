class AddCurrentValueToBottles < ActiveRecord::Migration
  def up
    add_column :bottles, :current_value, :decimal, precision: 5, scale: 2
    execute "UPDATE bottles SET current_value = price"
  end
  
  def down
    remove_column :bottles, :current_value
  end
end
