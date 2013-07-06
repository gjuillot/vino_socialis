class ChangeDescriptionTypeInBooks < ActiveRecord::Migration
  def up
    change_column :books, :description, :text, :limit => 500
  end

  def down
    change_column :books, :description, :text
  end
end
