class CreateBookRatings < ActiveRecord::Migration
def change
    create_table :book_ratings do |t|
      t.references :book
      t.references :user
      t.integer :note
      t.text :comment

      t.timestamps
    end
    add_index :book_ratings, :book_id
    add_index :book_ratings, :user_id
  end
end
