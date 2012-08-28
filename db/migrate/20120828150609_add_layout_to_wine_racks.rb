class AddLayoutToWineRacks < ActiveRecord::Migration
  def change
    add_column :wine_racks, :layout, :string, :default => 'simple'
  end
end
