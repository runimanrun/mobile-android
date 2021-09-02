*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageDashboard.robot
Resource    ../PageObject/PageLogin.robot
Resource    ../PageObject/PageRegister.robot
Resource    ../PageObject/PageForgot.robot
Resource    ../Test/TestLogin.robot
Resource    ../Utils/username.robot
Resource    ../Var/var.robot

*** Keywords ***
Pre Action Register
    PageDashboard.Click on Donasi Button
    Click Register Button
    Verify Register Page

Register with Empty Phone Number or Email and Name
    Pre Action Register
    Verify Register Button is Disabled

Register with Empty Name
    [Arguments]     ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Verify Register Button is Disabled

Register with Invalid Email or Phone Format
    [Arguments]     ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Verify Invalid Email or Phone Format

Register with Invalid Fullname Format
    [Arguments]     ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Invalid Full Name for Register  
    Verify Register Button is Disabled

Register with Existing Email
    [Arguments]     ${emailPhone}       ${fullName}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify Registered Email                         ${emailPhone}

Register with Request OTP
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      email       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button

Register with Resend OTP
    [Arguments]     ${emailPhone}       ${fullName}
    Register with Request OTP           ${emailPhone}       ${fullName}
    Verify Resend OTP

Register with Invalid Email OTP Key
    [Arguments]     ${emailPhone}       ${fullName}
    Register with Request OTP                       ${emailPhone}       ${fullName}
    Input OTP                                       123123
    Verify Invalid OTP

Register with 3 Times Invalid OTP Key
    [Arguments]     ${emailPhone}       ${fullName}
    Register with Request OTP           ${emailPhone}       ${fullName}
    repeat keyword  3 times             Input OTP           123123
    Verify 3 Times Invalid OTP

Register using Email with Password Less Than Minimum Char
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      email       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify OTP Key                                  ${service_env}      EMAIL       register    ${emailPhone}
    Verify Change Password Page
    PageForgot.Input New Password                   kitaa
    Verify Minimum Char Password

Register using Email with Invalid Confirm Password
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      email       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify OTP Key                                  ${service_env}      EMAIL       register    ${emailPhone}
    Verify Change Password Page
    PageForgot.Input New Password                   kitabisa
    PageForgot.Input Confirm Password               bisakita
    Verify Invalid Confirm Password

Register with Email
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      email       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify OTP Key                                  ${service_env}      EMAIL       register    ${emailPhone}
    Verify Change Password Page
    PageForgot.Input New Password                   kitabisa
    PageForgot.Input Confirm Password               kitabisa
    PageForgot.Click Save Button
    Post Login Action
    # Logout Process

Register with Existing Phone Number
    [Arguments]     ${emailPhone}       ${fullName}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify Registered Phone                         ${emailPhone}

Register with Invalid Phone OTP Key
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      phone       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Input OTP           123123
    Verify Invalid OTP

Register using Phone with Password Less Than Minimum Char
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      phone       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify OTP Key                                  ${service_env}      SMS       register    ${emailPhone}
    Verify Change Password Page
    PageForgot.Input New Password                   kitaaa
    Verify Minimum Char Password

Register using Phone with Invalid Confirm Password
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      phone       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify OTP Key                                  ${service_env}      SMS       register    ${emailPhone}
    Verify Change Password Page
    PageForgot.Input New Password                   kitabisa
    PageForgot.Input Confirm Password               bisakita
    Verify Invalid Confirm Password

Register with Phone Number
    [Arguments]     ${emailPhone}       ${fullName}
    Set Username to Whitelist                       ${service_env}      phone       ${emailPhone}
    Pre Action Register
    Input Email or Phone Number for Register        ${emailPhone}
    # Uncheck Whatsapp Binding
    Input Full Name for Register                    ${fullName}
    PageRegister.Click on Register Button
    Verify OTP Key                                  ${service_env}      SMS     register    ${emailPhone}
    Verify Change Password Page
    PageForgot.Input New Password                   kitabisa
    PageForgot.Input Confirm Password               kitabisa
    PageForgot.Click Save Button
    Post Login Action
    # Logout Process
