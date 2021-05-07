*** Settings ***
Resource    ../Resources/Base.robot
Resource    ../POM/LoginPagePO.robot
Resource    ../POM/SignUpPagePO.robot

Test Setup  Initialize browser
Test Teardown  Teardown
** Variables ***

*** Test Cases ***
Validate if all fields in Login page are available
   Given I'm on the Login Page of NOBP
   Then the following input fields should be available

Validate if "Forgot Password?" link is below the Password field
    Given I'm on the Login Page of NOBP
    Then I should be able to see the Forgot Password? link below the Password input field

Validate if "Sign up" link is below the Password field
    Given I'm on the Login Page of NOBP
    Then I should be able to see the Sign up link below the LOGIN button

Validate if the Login Page will be redirected to the Sign-up Page upon clicking "Sign up" link.
    Given I'm on the Login Page of NOBP
    When I click Sign up link below the LOGIN button
    Then the page shoud be redirected to the Accepts Terms and Conditions page