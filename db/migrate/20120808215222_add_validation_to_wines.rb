class AddValidationToWines < ActiveRecord::Migration
  def change
    add_column :wines, :validation, :boolean

  end
end
