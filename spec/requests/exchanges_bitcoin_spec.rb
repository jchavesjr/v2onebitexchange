require 'rails_helper'


RSpec.describe 'Exchanges', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #convert_bitcoin' do
    before do
      @amount_bitcoin = 1
    end

    it 'returns http success bitcoin' do
      get '/', params: {
                    to_currency_bitcoin: "BRL",
                    amount_bitcoin: @amount_bitcoin
                  }
      expect(response).to have_http_status(200)
    end
  end
end
