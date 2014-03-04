require 'spec_helper'

describe "a user can buy doge coin" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:doge_purchase) { Transaction.new(price: 0.000113, btc_total: 0, usd_total: (-1.13), buy: 0, doge_total: 20000) }

  it "can complete a transaction" do
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"

    visit user_path(user)

    within ".buy_doge" do
      expect(page).to have_content "Buy/Sell Doge"
    end

    click_link "Log Out #{user.user_name}"

    # click_button("Buy/Sell Doge") 
    # within ".table" do
    #   save_and_open_page
    #   expect(page).to have_content doge_purchase.usd_total

    # end

  end

end