class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.references :order, foreign_key: true
      t.string :name
      t.integer :quantity
      t.float :price
      t.float :length
      t.float :width
      t.float :height
      t.float :weight
      t.string :status, :default => 1
      t.string :description
      t.float :discount
      t.timestamps
    end
  end
end
