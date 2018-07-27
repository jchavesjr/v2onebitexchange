require 'spec_helper'
require 'json'
require './app/services/exchange_bitcoin_service'

describe 'Currency Bitcoin' do
  it 'exchange bitcoin' do
    amount_bitcoin = 1
    res = ExchangeBitcoinService.new("BRL", amount_bitcoin).perform
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount_bitcoin == 0).to eql(true)
  end
end
