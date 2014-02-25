require 'spec_helper'

describe "a user can buy doge coin" do
  let!(:doge_purchase) { Transaction.create(price: 600, btc_total: 2, usd_total: 1200, buy: 0)}
end