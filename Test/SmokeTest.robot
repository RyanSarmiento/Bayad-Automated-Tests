*** Settings ***
Resource  ../Resources/Base.robot
Resource  ../POM/LoginPagePO.robot
Resource  ../POM/OTPPagePO.robot
Resource  ../POM/DashboardPagePO.robot
Resource  ../POM/ElectricityUtilitiesPagePO.robot
Resource  ../POM/PayBillsPagePO.robot
Resource  ../POM/ConfirmationDetailsPagePO.robot
Resource  ../POM/PaymentGatewayPagePO.robot

Suite Setup  Initialize browser
Suite Teardown  Teardown

*** Variables ***

${emailAddress}  aron.braza@novare.com.hk
${password}      P@ssword1
@{otp}           1  2  3  4  5  6
${name}          Aron

${meralco_ReferenceNumber}  1000147292
${meralco_Amount}           5

${cardNumber}  4012 0010 3714 1112
${expiryDate}  1227  
${cvv}         212

*** Test Cases ***
Verify if I can Login my NOBP Account
#test1
    Given I'm on the Login Page of NOBP
    When I successfully inputted my email address and password  ${emailAddress}  ${password}
    And I click the Login button
    And successfully verified my OTP  @{otp}
    Then the page should be redirected to to NOBP Dashboard  ${name}
    Capture Page Screenshot  ${EXECDIR}/SmokeTesting_Screenshot/TC2.png

Verify if I can pay my bill/s in NOBP
    Given I'm in the NOBP Dashboard  ${name}
    When I click Electricty button
    And I click MERALCO biller
    And input all the required fields for Meralco Biller  ${meralco_ReferenceNumber}  ${meralco_Amount}
    And click the PAY BILL button
    And click the VISA payment method in Conformation Details
    And click the PAY BILL button in Confirmation Details
    And input my card details  ${cardNumber}  ${expiryDate}  ${cvv}
    And click Complete Order button
    Then the page should be redirected to NOBP Pay Bill Acknowledgement Page
    Sleep   10