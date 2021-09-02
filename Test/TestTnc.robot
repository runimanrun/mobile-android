*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot
Resource    ../PageObject/PageTnc.robot

*** Keywords ***
Navigate to Tnc Page
    Go To Account
    Verify Account Page
    Click Term and Conditions
    Verify Help Center Title
    Scroll Down Tnc Page
