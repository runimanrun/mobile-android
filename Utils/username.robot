*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Api/invalidateusername/invalidateusername.robot

*** Keywords ***
Set Username to Whitelist
    [Arguments]     ${environment}      ${usernameType}     ${emailPhone}
    Invalidate Username     ${environment}      ${usernameType}     ${emailPhone}
