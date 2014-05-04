class CreateMarketplaces < ActiveRecord::Migration
  def change
    create_table :marketplaces do |t|
      t.integer :item_id
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
