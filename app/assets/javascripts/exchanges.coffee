$(document).ready ->
 
  $('#amount,#target_currency').on 'blur', ->
    if $('form').attr('action') == '/convert'
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

  $('#invert').on 'click', ->
    invertMoedas = (moedaLocal,moedaPretendida) ->
      document.getElementById('source_currency').value = moedaPretendida
      document.getElementById('target_currency').value = moedaLocal

      moedaLocal = document.getElementById('source_currency').value
      moedaPretendida = document.getElementById('target_currency').value
      invertMoedas(moedaLocal,moedaPretendida)
      if $('form').attr('action') == '/convert'
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