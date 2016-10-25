class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.references :order_status, foreign_key: true
      #t.references :confirmation_order, foreign_key: true
      t.references :address, foreign_key: true
      t.timestamps
    end
  end
end
