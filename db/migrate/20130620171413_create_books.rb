class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :slug
      t.string :authors
      t.text :description
      t.string :editor
      t.string :isbn
      t.integer :pages
      t.string :amazon
      t.references :user
      t.string :category
      t.boolean :validation, default: false

      t.timestamps
    end
    
    add_index :books, :user_id
    add_index :books, :slug
  end
end
