class AddDrinkToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :drink_min, :integer, :default => 0
    add_column :bottles, :drink_max, :integer, :default => 0
    add_column :bottles, :drink_best, :integer, :default => 0
  end
end
