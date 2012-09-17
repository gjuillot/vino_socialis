class AddDateFormatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_format, :string, :default => ':default'
  end
end
