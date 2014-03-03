module PriceHelper

  def doge_price_usd
    return HTTParty.get("https://www.dogeapi.com/wow/?a=get_current_price&convert_to=USD&amount_doge=1000").round(4)
  end

  def get_current_price
    from_bitstamp = HTTParty.get("https://www.bitstamp.net/api/ticker/")
    return from_bitstamp["last"]
  end

end