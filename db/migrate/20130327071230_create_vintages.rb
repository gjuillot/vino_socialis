class CreateVintages < ActiveRecord::Migration
  def change
    create_table :vintages do |t|
      t.string :area
      t.integer :year
      t.references :user
      t.integer :note

      t.timestamps
    end
  end
end
