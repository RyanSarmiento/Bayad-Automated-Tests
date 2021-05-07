*** Settings ***
Library  SeleniumLibrary

** Variables ***

${url}     https://sat.online.bayad.com/ 
${browser}  chrome

*** Keywords ***

Initialize browser
    Open browser    ${url}  ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait  30
    

Teardown
    Close Browser