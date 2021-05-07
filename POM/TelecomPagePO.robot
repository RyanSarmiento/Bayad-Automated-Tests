*** Settings ***

*** Variables ***


${cableInternet_btnBayanTel}    css:[class='biller-tile-card'] [src*='bayan']

*** Keywords ***

I click Bayantel biller
    Click Element  ${cableInternet_btnBayanTel}