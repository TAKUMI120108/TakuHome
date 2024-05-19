class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :address_prefecture
      t.string :address_city
      t.string :distance
      t.string :distance_time
      t.integer :customer_id
      t.integer :rent
      t.integer :security_deposit
      t.integer :key_money
      t.integer :management_fee
      t.integer :guarantee_charge
      t.timestamps
      add_column :searches, :address, :string
      add_column :searches, :latitude, :float
      add_column :searches, :longitude, :float
    end
  end
end
