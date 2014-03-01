class AddDogeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :doge, :integer, default: 0
  end
end
