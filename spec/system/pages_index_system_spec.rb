require 'rails_helper'
 
RSpec.describe "Exchange Currency Process", :type => :system, js: true do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('BRL', from: 'source_currency')
      select('EUR', from: 'target_currency')
      fill_in 'amount', with: '10'
      click_button 'Botão para inverter a moeda'
      select('EUR', from: 'source_currency')
      select('BRL', from: 'target_currency')
    end
    
 
    # save_and_open_page
    expect(page).to have_content("value")
  end
end