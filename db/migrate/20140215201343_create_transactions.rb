class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :price
      t.decimal :btc
      t.decimal :usd
      t.boolean :buy
      t.boolean :sell
      t.references :user
      t.timestamps
    end
  end
end
