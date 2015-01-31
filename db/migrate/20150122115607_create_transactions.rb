class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :address
      t.integer :crypto
      t.integer :fiat
      t.float :crypto_quantity
      t.float :fiat_quantity
      t.string :email
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :transactions, :users
  end
end
