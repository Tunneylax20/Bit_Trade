FactoryGirl.define do
  factory :transaction do |t|
    price {("rand(400..700)").to_i}
    btc_total {("rand(10)").to_i}
    usd_total { price * btc_total }
    buy { ("rand(0..1)").to_i }
    association :user
  end
end