*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageKategoriFavorit.robot
Resource    ../PageObject/PageCampaignDetail.robot
Resource    ../PageObject/PageSummary.robot
Resource    ../PageObject/PagePaymentMethod.robot

*** Keywords ***
Make Payment
    Click Continue Payment
    Validate User Get the Summary Pop Up
    Close the Pop Up
    Validate User Redirected to Summary Page Properly
    Click Copy Account Number
    Validate Account Number Has Been Copied
    Click Back to Campaign
    Go Back
    Go Back

Choose Campaign
    Scroll To Galang Dana Mendesak
    Click First Galang Dana Mendesak

Donation without amount
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Click Continue Payment
    Error Message without amount

Donation below 1000
    [Arguments]     ${amount}       
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               ${amount}
    Click Continue Payment
    Error Message for 500

Donation not in multiple thousands
    [Arguments]     ${amount}       
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               ${amount}
    Click Continue Payment
    Error Message for not in multiple thousands

Donation without select payment method
    [Arguments]     ${amount}       
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               ${amount}
    Click Continue Payment
    Error Message for metode pembayaran

Create VA Donation
    [Arguments]     ${amount}       ${paymethod}
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               ${amount}
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               ${paymethod}
    Validate Minimum Amount Required    ${amount}

Create Bank Donation
    [Arguments]     ${amount}       ${paymethod}
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               ${amount}
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               ${paymethod}
    Validate Minimum Amount Required    ${amount}
    
Create Bank Donation with Amount Less Than Minimum Required
    [Arguments]     ${amount}       ${paymethod}
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               10000
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               ${paymethod}
    Input Donation Amount               ${amount}
    Validate Minimum Amount Required    ${amount}

Create VA Donation with Amount Less Than Minimum Required
    [Arguments]     ${amount}       ${paymethod}
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               10000
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               ${paymethod}
    Input Donation Amount               ${amount}
    Validate Minimum Amount Required    ${amount}
