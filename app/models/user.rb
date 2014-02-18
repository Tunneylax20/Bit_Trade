class User < ActiveRecord::Base

  has_many :transactions, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def current_usd_balance
    self.usd + Transaction.where(user: self).sum('usd_total').to_f
  end

  def current_btc_balance
    self.btc + Transaction.where(user: self).sum('btc_total').to_f
  end

  def get_current_price
    from_bitstamp = HTTParty.get("https://www.bitstamp.net/api/ticker/")
    return from_bitstamp["last"].to_f
  end

  def total_balance
    current_usd_balance + (current_btc_balance * get_current_price)
  end

end
