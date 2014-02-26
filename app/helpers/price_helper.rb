module PriceHelper

  def doge_price_usd
    return HTTParty.get("https://www.dogeapi.com/wow/?a=get_current_price&convert_to=USD&amount_doge=1000")
  end





end