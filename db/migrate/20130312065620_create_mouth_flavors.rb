class CreateMouthFlavors < ActiveRecord::Migration
  def change
    create_table :mouth_flavors do |t|
      t.string :name
    end
  end
end
