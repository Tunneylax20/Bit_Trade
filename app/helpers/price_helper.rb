module PriceHelper

  def doge_price_usd
    
    response = HTTParty.get("https://www.dogeapi.com/wow/v2/?a=get_current_price&convert_to=USD")
    doge = response["data"]["amount"].round(4)
    return doge

  end

  def get_current_price
    from_bitstamp = HTTParty.get("https://www.bitstamp.net/api/ticker/")
    return from_bitstamp["last"]
  end

end