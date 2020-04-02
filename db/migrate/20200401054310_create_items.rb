class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :status
      t.string :image_id
      t.text :body
      t.integer :category_id

      t.timestamps
    end
  end
end
