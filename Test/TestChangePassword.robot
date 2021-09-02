*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot
Resource    ../PageObject/PageSettings.robot
Resource    ../PageObject/PageChangePassword.robot

*** Keywords ***
Navigate to Change Password Page
    Click Change Password

Change Password with Invalid Old Password
    [Arguments]     ${oldPassword}      ${newPassword}      ${confirmPassword}
    Navigate to Change Password Page
    Input Old Password                          ${oldPassword}
    PageChangePassword.Input New Password       ${newPassword}
    PageChangePassword.Input Confirm Password   ${confirmPassword}
    Click Update Button

Change Password with Invalid Confirm Password
    [Arguments]     ${oldPassword}      ${newPassword}      ${confirmPassword}
    Navigate to Change Password Page
    Input Old Password                          ${oldPassword}
    PageChangePassword.Input New Password       ${newPassword}
    PageChangePassword.Input Confirm Password   ${confirmPassword}
    Click Update Button
    Validate Confirm Password Not Match

Change Password with Valid Password
    [Arguments]     ${oldPassword}      ${newPassword}      ${confirmPassword}
    Navigate to Change Password Page
    Input Old Password                          ${oldPassword}
    PageChangePassword.Input New Password       ${newPassword}
    PageChangePassword.Input Confirm Password   ${confirmPassword}
    Click Update Button
    Validate Success Change Password
