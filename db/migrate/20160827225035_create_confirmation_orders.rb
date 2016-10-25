class CreateConfirmationOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :confirmation_orders do |t|
      t.references :order, foreign_key: true
      t.string :code
      t.float :amount
      t.references :address, foreign_key: true
      t.timestamps
    end
  end
end
