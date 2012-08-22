class AddRemainingQuantityToBottles < ActiveRecord::Migration
  def change
    remove_column :bottles, :quantity
    add_column :bottles, :remaining_quantity, :integer
    add_column :bottles, :initial_quantity, :integer
  end
end
