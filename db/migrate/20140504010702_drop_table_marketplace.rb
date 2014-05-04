class DropTableMarketplace < ActiveRecord::Migration
  def change
  	drop_table :marketplaces
  end
end
