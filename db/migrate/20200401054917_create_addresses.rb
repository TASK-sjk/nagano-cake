class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :place
      t.integer :customer_id
      t.string :postcode
      t.string :receiver

      t.timestamps
    end
  end
end
