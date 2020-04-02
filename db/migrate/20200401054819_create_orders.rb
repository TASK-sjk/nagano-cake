class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status
      t.integer :customer_id
      t.integer :pay_type
      t.integer :total_price
      t.string :place
      t.string :postcode
      t.integer :shipping_fee
      t.string :receiver

      t.timestamps
    end
  end
end
