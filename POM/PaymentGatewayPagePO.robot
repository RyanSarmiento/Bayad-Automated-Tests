*** Settings ***

*** Variables ***

### TEXTBOX ###
${paymentGateway_txtCardNumber}  id:cardNumber
${paymentGateway_txtExpiryDate}  id:expiryDate
${paymentGateway_txtCvv}         id:cvv

### BUTTON ###
${paymentGateway_btnCompleteOrder}  id:pay

*** Keywords ***
input my card details
    [Arguments]  ${cardNumber}  ${expiryDate}  ${cvv}
    Input Text  ${paymentGateway_txtCardNumber}  ${cardNumber}
    Input Text  ${paymentGateway_txtExpiryDate}  ${expiryDate}
    Input Text  ${paymentGateway_txtCvv}  ${cvv}

click Complete Order button
    Click Button  ${paymentGateway_btnCompleteOrder}