*** Settings ***

*** Variables ***

${cableInternet_btnConverge}    css:[class='biller-tile-card'] [src*='CNVRG']

*** Keywords ***

I click Converge biller
    Click Element  ${cableInternet_btnConverge}
