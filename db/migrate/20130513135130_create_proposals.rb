class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.references :user
      t.string :page
      t.text :text
      t.boolean :opened, :default => true
      t.text :response

      t.timestamps
    end
    add_index :proposals, :user_id
    add_index :proposals, :opened
  end
end
