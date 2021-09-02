*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Api/getotp/getotp.robot
Resource    ../Api/removeotpcounter/removeotpcounter.robot

*** Keywords ***
Get OTP Key
    [Arguments]     ${environment}      ${channel}      ${type}     ${emailPhone}
    # ${environment}    : service environment [stg, uat]
    # ${channel}        : channel that receive otp key [SMS, WHATSAPP, EMAIL]  *must be UPPERCASE
    # ${type}           : scenario that need otp key [login, reset_password, register]
    # ${emailPhone}     : email address or phone number user

    ${otpKey}=      Get OTP             ${environment}      ${channel}      ${type}     ${emailPhone}
    [Return]        ${otpKey}

Clear OTP Counter
    [Arguments]     ${environment}      ${emailPhone}
    Remove OTP Counter      ${environment}      ${emailPhone}
