class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :usd, default: 25000
      t.decimal :btc, defualt: 0
      t.references :user
      t.timestamps
      
    end
  end
end
