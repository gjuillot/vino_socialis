class CommentsAndPlaceOfPurchaseForBottles < ActiveRecord::Migration
  def change
    change_table :bottles do |t|
      t.rename :comments, :channel_comments
      t.string :comments
    end
  end
end
