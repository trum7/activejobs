class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :telephone
      t.string :ip
      t.integer :status
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
