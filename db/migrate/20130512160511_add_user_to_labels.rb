class AddUserToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :user_id, :integer, :default => 1
  end
end
