*** Settings ***

*** Variables ***

@{details}   css:[class='float-right text-right']

### CARD ###

${confirmationDetails_cardPaymentReceipt}  css:[class*='acknowledgement-details']

### RADIO BUTTON
@{confirmationDetails_radioBtnVisa}  css:[class*='tickmark']


### BUTTON ###
${confirmationDetails_btnPayBill}        css:[class*='primary-btn']
${confirmationDetails_btnModalOkay}      css:[class*='info-yes-btn']
${confirmationDetails_btnOkay}           xpath://*[@class='btn primary-btn w-100' and text()='OKAY']

*** Keywords ***

click the VISA payment method in Conformation Details
    Click Element   ${confirmationDetails_radioBtnVisa}[0]

click the PAYMAYA payment method in Conformation Details
    Click Element   ${confirmationDetails_radioBtnVisa}[1]

click the PAY BILL button in Confirmation Details
    Click Button    ${confirmationDetails_btnPayBill}

the page should be redirected to NOBP Pay Bill Acknowledgement Page
    Click Button    ${confirmationDetails_btnModalOkay}
    Page Should Contain Element  ${confirmationDetails_cardPaymentReceipt}
    Page Should Contain  ACKNOWLEDGEMENT RECEIPT
    Page Should Contain  Reference Number
    Page Should Contain  Account Number
    Page Should Contain  Biller Name
    Page Should Contain  Bill Amount
    Page Should Contain  Biller Service Fee
    Page Should Contain  Convenience Fee
    Page Should Contain  Total Amount

