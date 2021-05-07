*** Settings ***

*** Variables ***

### TEXTBOX ###

${payBills_txtReferenceNumber}  id:referenceNumber
${payBills_txtAmount}           id:amount
${payBills_txtAccountName}      id:otherInfo.AccountName
${payBills_txtPhoneNumber}      id:otherInfo.PhoneNo
${payBills_txtCustomerName}     id:otherInfo.CustomerName
@{payBills_txtDatePicker}       css:[id*='mat-input']

### BUTTON ###
@{payBills_btnToggle}           css:[class*='slider']
${payBills_btnPayBill}          id:btnPayBills            

*** Keywords ***

input all the required fields for Meralco Biller
    [Arguments]  ${meralco_ReferenceNumber}  ${meralco_Amount}
    Input Text  ${payBills_txtReferenceNumber}  ${meralco_ReferenceNumber}
    Input Text  ${payBills_txtAmount}   ${meralco_Amount}
    Click Element  ${payBills_btnToggle}[0]

input all the required fields for Converge Biller
    [Arguments]  ${converge_ReferenceNumber}  ${converge_Amount}  ${converge_AccountName}
    Input Text  ${payBills_txtReferenceNumber}  ${converge_ReferenceNumber}
    Input Text  ${payBills_txtAmount}   ${converge_Amount}
    Input Text  ${payBills_txtPhoneNumber}   ${conerge_AccountName}
    Click Element  ${payBills_btnToggle}[0]

input all the required fields for Bayantel Biller
    [Arguments]  ${bayantel_ReferenceNumber}  ${bayantel_Amount}  ${bayantel_PhoneNumber}  ${bayantel_CustomerName}
    Input Text  ${payBills_txtReferenceNumber}  ${bayantel_ReferenceNumber}
    Input Text  ${payBills_txtAmount}   ${bayantel_Amount}
    Input Text  ${payBills_txtPhoneNumber}   ${bayantel_PhoneNumber}
    Input Text  ${payBills_txtCustomerName}   ${bayantel_CustomerName}

input all the required fields for Manila Water Biller
    [Arguments]  ${manilaWater_referenceNumber}  ${manilaWater_Amount}
    Input Text  ${payBills_txtReferenceNumber}  ${manilaWater_referenceNumber}
    Input Text  ${payBills_txtAmount}   ${manilaWater_Amount}
    Click Element  ${payBills_btnToggle}[0]

input all the required fields for Panelco Biller
    [Arguments]  ${panelco_ExpirationDate}  ${panelco_DueDate}
    Input Text  ${payBills_txtDatePicker}[0]  ${panelco_ExpirationDate}
    Click Element  ${payBills_txtDatePicker}[1]
    Input Text  ${payBills_txtDatePicker}[1]  ${panelco_DueDate}
    Click Element  ${payBills_btnToggle}[0]

click the PAY BILL button
    Wait Until Element Is Enabled   ${payBills_btnPayBill}    20
    Click Button    ${payBills_btnPayBill} 