require 'rest-client'
require 'json'

class ExchangeBitcoinService

  def initialize(to_currency_bitcoin, amount_bitcoin)
    @to_currency_bitcoin = to_currency_bitcoin
    @amount_bitcoin = amount_bitcoin.to_f
  end

  def perform
    begin

      url = "https://api.coindesk.com/v1/bpi/currentprice/#{@to_currency_bitcoin}.json"
      moeda = @to_currency_bitcoin
      res = RestClient.get(url)
      data = JSON.parse(res.body)
      value = data['bpi'][moeda]['rate_float'].to_f
      value * @amount_bitcoin

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
