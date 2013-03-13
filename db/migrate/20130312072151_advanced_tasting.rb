class AdvancedTasting < ActiveRecord::Migration
  def change
    add_column :tastings, :public_comment, :text
    add_column :tastings, :private_comment, :text
    add_column :tastings, :eye_intensity, :integer, :default => 0
    add_column :tastings, :eye_color, :integer, :default => 0
    add_column :tastings, :nose_intensity, :integer, :default => 0
    add_column :tastings, :nose_complexity, :integer, :default => 0
    add_column :tastings, :mouth_acidity, :integer, :default => 0
    add_column :tastings, :mouth_bitterness, :integer, :default => 0
    add_column :tastings, :mouth_alcohol, :integer, :default => 0
    add_column :tastings, :mouth_sweet, :integer, :default => 0
    add_column :tastings, :mouth_tanins, :integer, :default => 0
    add_column :tastings, :mouth_co2, :integer, :default => 0
    add_column :tastings, :mouth_complexity, :integer, :default => 0
  end
end
