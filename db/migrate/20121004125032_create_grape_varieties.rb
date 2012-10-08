class CreateGrapeVarieties < ActiveRecord::Migration
  def change
    create_table :grape_varieties do |t|
      t.string :name
      t.boolean :validation, default: false
    end
  end
end
