class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :item_id
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
