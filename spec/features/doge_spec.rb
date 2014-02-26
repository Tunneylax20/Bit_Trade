require 'spec_helper'

describe "a user can buy doge coin" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:doge_purchase) { Transaction.create(price: 0.000113, btc_total: 0, usd_total: (-1.13), buy: 0, doge: 10000) }



end