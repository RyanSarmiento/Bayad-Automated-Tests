*** Settings ***
*** Variables ***

### Icon ###
${login_iconMask}                   css:[class*='mat-form-field-suffix']

### LABEL ###
${login_lblWelcomeToBayadOnline}    css:[class*='welcome-text']


### LINK ###
${login_lnkForgotPassword}  id:forgot-password-link
${login_lnkSignUp}          id:sign-up-link

### TEXTBOX ###
${login_txtEmailAddress}    id:emailAddress
${login_txtPassword}        id:password


### BUTTON ###
${login_btnLogin}           id:login-btn

*** Keywords ***

### GIVEN ###

I'm on the Login Page of NOBP
    Wait Until Page Contains Element    ${login_lblWelcomeToBayadOnline}
    Element Text Should Be              ${login_lblWelcomeToBayadOnline}    Welcome to Bayad Online!


### WHEN ###

I click Sign up link below the LOGIN button
    Click Element   ${login_lnkSignUp}

I successfully inputted my email address and password
    [Arguments]  ${emailAddress}  ${password}
    Input Text  ${login_txtEmailAddress}  ${emailAddress}
    Input Text  ${login_txtPassword}  ${password}


I click the Login button
    Wait Until Element Is Enabled   ${login_btnLogin}   20
    Click Button    ${login_btnLogin}

I login to NOBP
    [Arguments]  ${emailAddress}  ${password}
    Input Text  ${login_txtEmailAddress}  ${emailAddress}
    Input Text  ${login_txtPassword}  ${password}
    Wait Until Element Is Enabled   ${login_btnLogin}   20
    Click Button    ${login_btnLogin} 

### THEN ###
the following input fields should be available
    Page Should Contain Textfield   ${login_txtEmailAddress}
    Page Should Contain Textfield   ${login_txtPassword}

I should be able to see the Forgot Password? link below the Password input field
    Page Should Contain Element        ${login_lnkForgotPassword}

I should be able to see the Sign up link below the LOGIN button
    Page Should Contain Element        ${login_lnkSignUp}