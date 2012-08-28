class RenameWineRackBottles < ActiveRecord::Migration
  def change
    rename_table :wine_rack_bottles, :wine_rack_positions
  end
end
