class AddWineDescriptionToArea < ActiveRecord::Migration
  def change
    add_column :areas, :wine_description, :text
  end
end
