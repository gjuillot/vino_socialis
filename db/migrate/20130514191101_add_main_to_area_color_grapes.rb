class AddMainToAreaColorGrapes < ActiveRecord::Migration
  def change
    add_column :area_color_grapes, :main, :boolean, :default => true
  end
end
