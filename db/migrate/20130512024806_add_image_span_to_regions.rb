class AddImageSpanToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :image_span, :integer, :default => 6
    add_column :regions, :image_right_column_length, :integer, :default => 50
  end
end
