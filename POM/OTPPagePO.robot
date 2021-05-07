*** Settings ***

*** Variables ***

### OTP Fields ###
${otp_fieldDigit0}  id:digit-0
${otp_fieldDigit1}  id:digit-1
${otp_fieldDigit2}  id:digit-2
${otp_fieldDigit3}  id:digit-3
${otp_fieldDigit4}  id:digit-4
${otp_fieldDigit5}  id:digit-5

### BUTTON ###
${otp_btnVerify}    id:verify-otp-btn

*** Keywords ***

successfully verified my OTP
    [Arguments]  @{otp}
    Input Text  ${otp_fieldDigit0}  ${otp}[0]
    Input Text  ${otp_fieldDigit1}  ${otp}[1]
    Input Text  ${otp_fieldDigit2}  ${otp}[2]
    Input Text  ${otp_fieldDigit3}  ${otp}[3]
    Input Text  ${otp_fieldDigit4}  ${otp}[4]
    Input Text  ${otp_fieldDigit5}  ${otp}[5]
    Click Button  ${otp_btnVerify}
    