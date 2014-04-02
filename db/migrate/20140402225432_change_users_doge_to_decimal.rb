class ChangeUsersDogeToDecimal < ActiveRecord::Migration
  def change
    change_column :users, :doge, :decimal
  end
end
