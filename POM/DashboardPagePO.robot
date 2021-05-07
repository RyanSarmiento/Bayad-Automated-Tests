*** Settings ***

*** Variables ***

### TEXTBOX ###

${dashboard_txtSearch}      css:[id*='mat-input']

### Button ###
${dashboard_btnElectricity}       id:btnCardElectricity
${dashboard_btnWater}             id:btnCardWater
${dashboard_btnTelecoms}          id:btnCardTelco
${dashboard_btnCableInternet}     id:btnCardCable
${dashboard_btnGovernment}        id:btnCardGovernment
${dashboard_btnToll}              id:btnCardTravel
${dashboard_btnShowMore}          id:btnCardMore
${dashboard_btnGateway}           css:[id='btnCardGateway'] [src*='gateway']
${dashboard_btnInsurance}         css:[id='btnCardGateway'] [src*='Insurance']
${dashboard_btnRealEstate}        css:[id='btnCardGateway'] [src*='real-estate']


*** Keywords ***

the page should be redirected to to NOBP Dashboard
    [Arguments]  ${name}
    Page Should Contain  Hello, ${name}!
    Log  Hello, ${name}!
    Page Should Contain  MY SAVED BILLERS
    Page Should Contain  BUY LOAD
    Page Should Contain  BILLS PAYMENT
    Page Should Contain  TRANSACTION HISTORY

I'm in the NOBP Dashboard
    [Arguments]  ${name}
    the page should be redirected to to NOBP Dashboard  ${name}

I search ${billerName} in Search for biller field
    Click Element  ${dashboard_txtSearch}
    Input Text  ${dashboard_txtSearch}  ${billerName}
    Wait Until Page Contains Element    css:[id*='mat-autocomplete']    20
    Press Keys  css:[class*='mat-autocomplete']  RETURN

I click Electricty button
    CLick Element   ${dashboard_btnElectricity}

I click Cable Internet button
    CLick Element   ${dashboard_btnCableInternet} 

I click Telecoms button
    CLick Element   ${dashboard_btnTelecoms}
    
    