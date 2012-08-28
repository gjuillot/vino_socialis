class AddMultipleToWineRacks < ActiveRecord::Migration
  def change
    add_column :wine_racks, :total_rows, :integer, :default => 1
    add_column :wine_racks, :total_columns, :integer, :default => 1
    add_column :wine_rack_positions, :total_row, :integer, :default => 0
    add_column :wine_rack_positions, :total_column, :integer, :default => 0
  end
end
