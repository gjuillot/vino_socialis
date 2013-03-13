class AddTastingsFlavorsJoinTable < ActiveRecord::Migration
  def up
    create_table :nose_flavors_tastings, :id => false do |t|
      t.integer :nose_flavor_id
      t.integer :tasting_id
    end
    create_table :mouth_flavors_tastings, :id => false do |t|
      t.integer :mouth_flavor_id
      t.integer :tasting_id
    end
  end

  def down
    drop_table :nose_flavors_tastings
    drop_table :mouth_flavors_tastings
  end
end
