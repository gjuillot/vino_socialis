class CreateWineColors < ActiveRecord::Migration
  def change
    create_table :wine_colors do |t|
      t.string :name

      t.timestamps
    end
  end
end
