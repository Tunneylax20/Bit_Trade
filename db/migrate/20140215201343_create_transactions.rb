class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :price
      t.decimal :btc_total
      t.decimal :usd_total
      t.boolean :buy
      t.references :user
      t.timestamps
    end
  end
end
