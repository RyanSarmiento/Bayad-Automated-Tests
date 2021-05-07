*** Settings ***

*** Variables ***

### LINK ###

${signUp_lnkTermsCondition}     id:tac-link
${signUp_lnkPrivacyPolicy}      id:dpp-link

### BUTTON ###


*** Keywords ***

### THEN ###
the page shoud be redirected to the Accepts Terms and Conditions page
    Page Should Contain     PRIVACY NOTICE
    Page Should Contain     PERSONALIZE YOUR EXPERIENCE
    Page Should Contain Element  ${signUp_lnkTermsCondition}
    Page Should Contain Element  ${signUp_lnkPrivacyPolicy} 
