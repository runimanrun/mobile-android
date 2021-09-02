*** Settings ***
Library         AppiumLibrary
Resource        ../PageObject/PageHome.robot
Resource        ../PageObject/PageDonasiRutin.robot
Resource        ../PageObject/PageCampaignDetail.robot
Resource        ../PageObject/PagePaymentMethod.robot
Resource        ../Utils/username.robot

*** Keywords ***
Validate Go to Donasi Rutin
    Verify Donation Tile
    Verify Donation Rutin Tab

Validate Donasi Rutin Page Show Properly
    Verify Donasi Rutin Page

Donate to Donasi Rutin
    Choose Donasi Rutin Campaign
    PageCampaignDetail.Click on Donasi Button

Input Donasi Rutin Amount
    [Arguments]     ${amount}
    Input Amount to Donasi Rutin        ${amount}

Choose Payment Date
    Select Payment Date

Choose Donasi Rutin Payment
    Choose Payment Donasi Rutin
    Select Payment Method               vabca

Confirm Donasi Rutin
    Verify Donate to Donasi Rutin
    Activate Donasi Rutin

Change Data Donasi Rutin which set
    [Arguments]         ${amount}
    Verify Activated Campaign on Donasi Rutin
    Change Donasi Rutin
    Input Amount to Donasi Rutin        ${amount}
    Verify Donate to Donasi Rutin

Delete Data Donasi Rutin which set
    Verify Activated Campaign on Donasi Rutin
    Stop Donasi Rutin
    Confirm Stop Donasi Rutin
