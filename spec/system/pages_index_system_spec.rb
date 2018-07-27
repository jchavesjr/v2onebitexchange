require 'rails_helper'

describe "Exchange Currency Process", :type => :system, js: true do
  it "exchange page" do
    visit '/'
    within("#exchange_form") do

      select('EUR', from: 'source_currency')
      select('USD', from: 'target_currency')
      fill_in 'amount', with: '1000', visible: true
    end

    script = "var e = jQuery.Event('keyup'); e.which = 13; $('#amount').trigger(e)"
    page.execute_script(script)
    result = find("#result").value
    expect(page).to have_content(result)
  end

  it "exchange page invert" do
    visit '/'
    select('EUR', from: 'source_currency')
    select('USD', from: 'target_currency')
    click_button 'Inverter Moeda'
    page.has_select?('source_currency', selected: 'USD')
    page.has_select?('target_currency', selected: 'EUR')
  end

  it "exchange page bitcoin" do
    visit '/'
    click_button 'Bitcoin'
    within("#exchange_bitcoin_form") do
      select('BRL', from: 'to_currency_bitcoin')
      fill_in 'amount_bitcoin', with: '1', visible: true
    end
    script = "var e = jQuery.Event('keyup'); e.which = 13; $('#amount_bitcoin').trigger(e)"
    result = find("#result").value
    expect(page).to have_content(result)
  end


end
