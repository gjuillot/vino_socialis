class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commented_type
      t.integer :commented_id
      t.references :user
      t.text :comment

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
