class ChangeTypesInBooks < ActiveRecord::Migration
  def up
    change_column :books, :amazon, :text
  end

  def down
    change_column :books, :amazon, :text
  end
end
