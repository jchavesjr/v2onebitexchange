$(document).ready ->

  $('.bitcoin').hide()
  $('#voltar').hide()

  $('#convertBitcoin').click ->
    $('.principal').hide()
    $('#convertBitcoin').hide()
    $('.bitcoin').show()
    $('#voltar').show()
    document.getElementById("result").value = ''
    document.getElementById("amount_bitcoin").value = ''

  $('#voltar').click ->
    $('.principal').show()
    $('#convertBitcoin').show()
    $('.bitcoin').hide()
    $('#voltar').hide()
    document.getElementById("result").value = ''
    document.getElementById("amount").value = ''


  $('#amount').keyup ->
    if $('#exchange_form').attr('action') == '/convert'
      $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;

  $('#amount_bitcoin').keyup ->
    if $('#exchange_bitcoin_form').attr('action') == '/convert_bitcoin'
      $.ajax '/convert_bitcoin',
        type: 'GET'
        dataType: 'json'
        data: {
                  to_currency_bitcoin: $("#to_currency_bitcoin").val(),
                  amount_bitcoin: $("#amount_bitcoin").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;

  $('#invert').on 'click', ->
    invertMoedas = (moedaLocal,moedaPretendida) ->
      document.getElementById('source_currency').value = moedaPretendida
      document.getElementById('target_currency').value = moedaLocal

    moedaLocal = document.getElementById('source_currency').value
    moedaPretendida = document.getElementById('target_currency').value

    invertMoedas(moedaLocal,moedaPretendida)
