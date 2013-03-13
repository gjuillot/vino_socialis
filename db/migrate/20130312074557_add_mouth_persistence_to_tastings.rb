class AddMouthPersistenceToTastings < ActiveRecord::Migration
  def change
    add_column :tastings, :mouth_persistence, :integer, :default => 0
  end
end
