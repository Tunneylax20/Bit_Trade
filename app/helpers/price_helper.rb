module PriceHelper

  def doge_price_btc
    return HTTParty.get("https://www.dogeapi.com/wow/?a=get_current_price&convert_to=BTC&amount_doge=1000")
  end





end