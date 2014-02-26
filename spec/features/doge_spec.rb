require 'spec_helper'

describe "a user can buy doge coin" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:doge_purchase) { Transaction.create(price: 0.000113, btc_total: 0, usd_total: (-1.13), buy: 0, doge: 10000) }

  it "can complete a transaction" do
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"

    visit user_path(user)

    save_and_open_page

    within ".buy_doge" do
      expect(page).to have_content doge_total
    end
    click_link("Buy/Sell Doge") 
    within ".table" do
      expect(page).to have_content doge_purchase.doge
    end

  end

end