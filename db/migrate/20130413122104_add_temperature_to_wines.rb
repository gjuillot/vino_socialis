class AddTemperatureToWines < ActiveRecord::Migration
  def change
    add_column :wines, :temperature, :string
  end
end
