require 'spec_helper'

describe "a user can buy doge coin" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:btc_purchase) { Transaction.new(btc_total: 3) }

  it "can can create an account" do

    visit "/"
    click_link "Create Account"
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password_confirmation
    fill_in :user_user_name, with: user.user_name
    click_button "Create Account"

    ### Not bringing us to the user#show page ###
    
    visit user_path(user)

    save_and_open_page

    within ".buy_btc" do 
      fill_in :id, with: btc_purchase.btc_total
      expect(page).to have_content btc_purchase.btc_total
      click_button "Buy/Sell BTC"
    end



  end

end