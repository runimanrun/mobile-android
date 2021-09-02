*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageDashboard.robot
Resource    ../PageObject/PageLogin.robot
Resource    ../PageObject/PageForgot.robot
Resource    ../Var/var.robot

*** Keywords ***
Pre Action Forgot
    [Arguments]     ${emailPhone}
    PageDashboard.Click on Donasi Button
    Input Username                  ${emailPhone}
    Click Next Button

Forgot Password with Unregistered Phone Number
    [Arguments]     ${emailPhone}
    Pre Action Forgot               ${phoneLogin}
    Click Forgot Password
    Verify Forgot Password Page
    Input Phone or Email            ${emailPhone}
    PageForgot.Click Send Button
    Verify Unregistered Phone or Email

Forgot Password with Unregistered Email
    [Arguments]     ${emailPhone}
    Pre Action Forgot               ${activationEmail}
    Click Forgot Password
    Verify Forgot Password Page
    Input Phone or Email            ${emailPhone}
    PageForgot.Click Send Button
    Verify Unregistered Phone or Email

Forgot Password Using Existing Account
    [Arguments]     ${emailPhone}    ${type}
    Pre Action Forgot               ${emailPhone}
    Click Forgot Password
    Verify Forgot Password Page
    Input Phone or Email            ${emailPhone}
    PageForgot.Click Send Button
    Verify OTP Key        ${service_env}      ${type}       reset_password    ${emailPhone}
    Verify Change Password Page
    PageForgot.Input New Password                   k1tab1s
    PageForgot.Input Confirm Password               k1tab1s
    PageForgot.Click Save Button
    Verify Changes Password Popup
    Click Masuk Button

Forgot Password with 3 Times Invalid OTP
    [Arguments]     ${emailPhone}
    Pre Action Forgot               ${activationEmail}
    Click Forgot Password
    Verify Forgot Password Page
    Input Phone or Email            ${emailPhone}
    PageForgot.Click Send Button
    repeat keyword  3 times         Input OTP                       123123
    Verify 3 Times Invalid OTP
