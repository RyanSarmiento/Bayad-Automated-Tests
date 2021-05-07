*** Settings ***
Resource  ../Resources/Base.robot
Resource  ../POM/LoginPagePO.robot
Resource  ../POM/OTPPagePO.robot
Resource  ../POM/DashboardPagePO.robot
Resource  ../POM/ElectricityUtilitiesPagePO.robot
Resource  ../POM/CableInternetPagePO.robot
Resource  ../POM/TelecomPagePO.robot
Resource  ../POM/PayBillsPagePO.robot
Resource  ../POM/ConfirmationDetailsPagePO.robot
Resource  ../POM/PaymentGatewayPagePO.robot

Test Setup  Initialize browser
Test Teardown  Teardown

*** Variables ***
${emailAddress}  aron.braza@novare.com.hk 
${password}      P@ssword1
@{otp}           1  2  3  4  5  6
${name}          Aron

### Converge  ###
${converge_referenceNumber}  0010101534870
${converge_amount}           50
${converge_AccountName}      Juan Dela Cruz

### Bayantel ###
${bayantel_ReferenceNumber}  302293899
${bayantel_Amount}           50
${bayantel_PhoneNumber}      123456
${bayantel_CustomerName}     John Dell

### Panelco ###
${panelco_ExpirationDate}  05/07/2021
${panelco_DueDate}         05/14/2021

${cardNumber}  4012 0010 3714 1112
${expiryDate}  1227  
${cvv}         212

*** Test Cases ***

Converge
    Given I successfully logged in NOBP  ${emailAddress}  ${password}
    And I'm in the NOBP Dashboard  ${name}
    When I click Cable Internet button
    And I click Converge biller
    And input all the required fields for Meralco Biller  ${referenceNumber}  ${amount}
    And click the PAY BILL button
    And click the VISA payment method in Conformation Details
    And click the PAY BILL button in Confirmation Details
    And input my card details  ${cardNumber}  ${expiryDate}  ${cvv}
    And click Complete Order button
    Then the page should be redirected to NOBP Pay Bill Acknowledgement Page

Bayantel
    Given I successfully inputted my email address and password  ${emailAddress}  ${password}
    And I click the Login button
    And successfully verified my OTP  @{otp}
    And I'm in the NOBP Dashboard  ${name}
    When I click Telecoms button
    And I click Bayantel biller
    And input all the required fields for Bayantel Biller  ${bayantel_ReferenceNumber}  ${bayantel_Amount}  ${bayantel_PhoneNumber}  ${bayantel_CustomerName}
    And click the PAY BILL button
    And click the VISA payment method in Conformation Details
    And click the PAY BILL button in Confirmation Details
    And input my card details  ${cardNumber}  ${expiryDate}  ${cvv}
    And click Complete Order button
    Then the page should be redirected to NOBP Pay Bill Acknowledgement Page
    #Capture Page Screenshot  ${EXECDIR}/BillsPayment_Screenshots/Bayantel_Receipt.png

Panelco
    Given I successfully inputted my email address and password  ${emailAddress}  ${password}
    And I click the Login button
    And successfully verified my OTP  @{otp}
    And I'm in the NOBP Dashboard  ${name}
    When I click Electricty button
    And I click Panelco biller
    And input all the required fields for Panelco Biller  ${panelco_ExpirationDate}  ${panelco_DueDate}
    Sleep  10
    #And click the PAY BILL button
    #And click the VISA payment method in Conformation Details
    #And click the PAY BILL button in Confirmation Details
    #And input my card details  ${cardNumber}  ${expiryDate}  ${cvv}
    #And click Complete Order button
    #Then the page should be redirected to NOBP Pay Bill Acknowledgement Page
