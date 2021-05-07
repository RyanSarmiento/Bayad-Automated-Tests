*** Settings ***


*** Variables ***

### Electricty Utilities Billers ###
${electricityUtilities_btnMeralco}   css:[class='biller-tile-card'] [src*='MECOR']
${electricityUtilities_btnPanelco}   css:[class='biller-tile-card'] [src*='PNCO1']

### DROPDOWN ###
${electricityUtilities_ddlSelectBiller}     css:[class*='mat-form-field-flex']

### MENU ###
${electricityUtilities_menuMeralco}  xpath://*[@class='mat-option-text' and text()=' MERALCO ']

*** Keywords ***

I click MERALCO biller
    Click Element   ${electricityUtilities_btnMeralco}
    #Click Element   css:[class*='mat-form-field-flex']
    #Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    #Click Element   ${electricityUtilities_menuMeralco}
I click Panelco biller
    Click Element   ${electricityUtilities_btnPanelco}








