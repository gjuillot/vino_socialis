class CreateEstates < ActiveRecord::Migration
  def change
    create_table :estates do |t|
      t.string :name
      t.references :user
      t.string :owner
      t.string :address
      t.string :zip_code
      t.string :town
      t.string :country
      t.string :phone
      t.string :fax
      t.string :email
      t.string :www
      t.boolean :validation, default: false

      t.timestamps
    end
    add_index :estates, :user_id
  end
end
