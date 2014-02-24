class AddDogePriceToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :doge, :decimal, default: 0
  end
end
