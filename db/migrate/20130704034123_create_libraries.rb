class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :user
      t.references :book
    end
    
    add_index :libraries, :user_id
    add_index :libraries, :book_id
  end
end
