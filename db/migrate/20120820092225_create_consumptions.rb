class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.references :user
      t.references :bottle
      t.date :date
      t.integer :quantity
      t.string :reasons
      t.text :comments

      t.timestamps
    end
    add_index :consumptions, :user_id
    add_index :consumptions, :bottle_id
  end
end
