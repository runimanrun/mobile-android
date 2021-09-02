*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageCampaignDetail.robot
Resource    ../PageObject/PagePaymentMethod.robot

*** Keywords ***
Validate Campaign List on Galang Dana Mendesak
    Verify Home Page
    Scroll To Galang Dana Mendesak
    Swipe on Galang Dana Mendesak
    Click First Galang Dana Mendesak
    Validate User Directed to Campaign Detail Page Properly

Donation from Galang Dana Mendesak
    [Arguments]     ${amount}       ${paymethod}
    Verify Home Page
    Scroll To Galang Dana Mendesak
    Click First Galang Dana Mendesak
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               ${amount}
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               ${paymethod}
    Validate Minimum Amount Required    ${amount}
