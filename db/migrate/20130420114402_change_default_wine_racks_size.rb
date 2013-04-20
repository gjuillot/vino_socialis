class ChangeDefaultWineRacksSize < ActiveRecord::Migration
  def up
    change_column :wine_racks, :total_rows, :integer, :default => 2
    change_column :wine_racks, :total_columns, :integer, :default => 3
    change_column :wine_racks, :rows, :integer, :default => 4
    change_column :wine_racks, :columns, :integer, :default => 5
  end

  def down
  end
end
