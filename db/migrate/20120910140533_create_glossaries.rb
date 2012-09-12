class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.string :lang
      t.string :word
      t.text :definition

      t.timestamps
    end
  end
end
