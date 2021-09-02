*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageDashboard.robot
Resource    ../PageObject/PageLogin.robot
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot
Resource    ../PageObject/PageOnboarding.robot
Resource    ../Var/var.robot

*** Keywords ***
Pre Login Action
    PageDashboard.Click on Donasi Button
    Verify Login Page
    
Post Login Action
    Set Favourite Category Campaign
    Skip First Donation
    Click Allow on Permission Pop Up
    Verify Home Page

Login with Empty Phone Number or Email
    Pre Login Action
    Verify Lanjutkan Button is Disabled

Login with Invalid Email or Phone Format
    [Arguments]     ${emailphone}
    Pre Login Action
    Input Username                  ${emailphone}
    Verify Invalid Phone or Email Format

Login with Invalid Password
    [Arguments]     ${emailphone}
    Pre Login Action
    Input Username                  ${emailphone}
    Click Next Button
    Input User Password             kitatidakbisa
    Click Login Button
    Verify Invalid Password
    Click Login Button
    Verify Invalid Password Twice

Login with 3 Times Invalid Email OTP Key
    [Arguments]     ${email}
    Pre Login Action
    Input Username                  ${email}
    Click Next Button
    Choose Login with Email OTP
    repeat keyword  3 times         Input OTP                       123123
    Verify 3 Times Invalid OTP

Login with 3 Times Invalid Password
    [Arguments]     ${emailphone}
    Pre Login Action
    Input Username                  ${emailphone}
    Click Next Button
    Input User Password             kitatidakbisa
    Click Login Button
    Verify Invalid Password
    Click Login Button
    Verify Invalid Password Twice
    Click Login Button
    Verify Pemulihan Akun

Login with Email and Password
    [Arguments]     ${email}        ${password}
    Pre Login Action
    Input Username                  ${email}
    Click Next Button
    Input User Password             ${password}
    Click Login Button
    Post Login Action

Relogin After Change Password
    [Arguments]     ${email}        ${password}
    Input Username                  ${email}
    Click Next Button
    Input User Password             ${password}
    Click Login Button
    Post Login Action

Login with Email and OTP
    [Arguments]     ${email}
    Pre Login Action
    Input Username                  ${email}
    Click Next Button
    Choose OTP Email Method
    Verify OTP Key                  ${service_env}      EMAIL     login       ${email}
    Post Login Action
    Logout Process

Login with Unregistered Email
    [Arguments]     ${email}
    Pre Login Action
    Input Username                  ${email}
    Click Next Button
    Verify Unregistered Email       ${email}
    Click Cancel Popup Regis Button

Login with 3 Times Invalid Phone OTP Key
    [Arguments]     ${phone}
    Pre Login Action
    Input Username                  ${phone}
    Click Next Button
    Choose Login with SMS OTP
    repeat keyword  3 times         Input OTP                       123123
    Verify 3 Times Invalid OTP

Login with Phone and Password
    [Arguments]     ${phone}        ${password}
    Pre Login Action
    Input Username                  ${phone}
    Click Next Button
    Input User Password             ${password}
    Click Login Button
    Post Login Action
    Logout Process

Login with Phone and OTP
    [Arguments]     ${phone}
    Pre Login Action
    Input Username                  ${phone}
    Click Next Button
    Choose Login with SMS OTP
    Verify OTP Key                  ${service_env}      SMS     login       ${phone}
    Post Login Action
    Logout Process

Login with Whatsapp and OTP
    [Arguments]     ${phone}
    Pre Login Action
    Input Username                  ${phone}
    Click Next Button
    Choose Login with Whatsapp OTP
    Verify OTP Key                  ${service_env}      WHATSAPP        login       ${phone}
    Post Login Action
    Logout Process

Login with Unregistered Phone
    [Arguments]     ${phone}
    Pre Login Action
    Input Username                  ${phone}
    Click Next Button
    Verify Unregistered Phone       ${phone}
    Click Cancel Popup Regis Button

Logout Process
    Go To Account
    Verify Account Page
    Click Logout

# Login with Change Email
#     [Arguments]     ${email}        ${changedEmail}
#     Pre Login Action
#     Input Username                  ${email}
#     Click Next Button
#     Click Change Username
#     Verify Username Changed         hisyammukh76@gmail.com
#     # Click Next Button