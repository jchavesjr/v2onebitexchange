RSpec.configure do |config|
    config.before(:each) do
      stub_request(:get, /currencydatafeed.com/ )
      .with(headers: {
        'Accept'=>'*/*'
      }).to_return(status: 200, body: '
        {
          "status": true,
          "currency": [
              {
                  "currency": "USD/BRL",
                  "value": "3.41325",
                  "date": "2018-04-20 17:22:59",
                  "type": "original"
              }
          ]
        }', headers: {})
      stub_request(:get, /api.coindesk.com/ )
      .with(headers: {
        'Accept'=>'*/*'
      }).to_return(status: 200, body: '
        {
          "bpi":{"USD":{"code":"USD", "rate":"7,903.1650", "description":"United States Dollar", "rate_float":7903.165}, 
          "BRL":{"code":"BRL", "rate":"29,605.3359", "description":"Brazilian Real", "rate_float":29605.3359}}

        }', headers: {})
    end
end
