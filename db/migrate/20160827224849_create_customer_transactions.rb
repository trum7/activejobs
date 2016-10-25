class CreateCustomerTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_transactions do |t|
      t.string :description
      t.float :amount
      t.string :braintreeid
      t.string :braintreetype
      t.string :braintreestatus
      t.references :order, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :address, foreign_key: true
      t.timestamps
    end
  end
end
