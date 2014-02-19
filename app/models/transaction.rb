class Transaction < ActiveRecord::Base
  belongs_to :user

  validates :price, presence: true
  validates :btc_total, presence: true
  validates :usd_total, presence: true
  validates :buy, presence: true
  validates :user_id, presence: true
  # validates :usd_total, :numericality => { :greater_than => 0 }

  
end
