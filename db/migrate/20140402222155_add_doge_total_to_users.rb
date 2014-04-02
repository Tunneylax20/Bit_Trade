class AddDogeTotalToUsers < ActiveRecord::Migration
  def change
    add_column :transactions, :doge_total, :decimal, default: 0
  end
end
