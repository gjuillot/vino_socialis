class CreateNoseFlavors < ActiveRecord::Migration
  def change
    create_table :nose_flavors do |t|
      t.string :name
    end
  end
end
