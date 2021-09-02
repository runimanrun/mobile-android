*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageSalingJaga.robot
Resource    ../PageObject/PageKeanggotaan.robot
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageCampaignDetail.robot
Resource    ../PageObject/PagePaymentMethod.robot
Resource    ../PageObject/PageSummary.robot

*** Keywords ***

Verify Saling Jaga Page
    Verify Home Page
    Go To Saling Jaga
    Verify Saling Jaga Screen
    
Add Family Members
    [Arguments]      ${relation}     ${status}       ${phone}
    Verify Saling Jaga Page
    Go To Keanggotaan
    Verify Keanggotaan Screen
    Click Add Member Button
    Verify Add Member Screen
    # Select Program              ${program}
    Select Relation Status      ${relation}
    Input Relation Name
    # Input Relation Birthdate
    Input Relation Phone        ${phone}
    Click Agreement Checklist
    PageKeanggotaan.Click Lanjut Button
    Click Confirm Add Member Button
    Input Donation Amount               10000
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               Dompet Kebaikan
#    PageCampaignDetail.Click on Donasi Button
#    Click See Member Button

Verify New Family Member with KTP Less Than 16 Digits
    [Arguments]     ${ktp}
    Verify Home Page
    Go To Saling Jaga
    Verify Saling Jaga Screen
    Go To Keanggotaan
    Verify Keanggotaan Screen
    Click Lainnya Tab
    Click Verify Last Family Card
    Verify Verification Keanggotaan Screen
    Input Full Name
    Input KTP Number            ${ktp}
    Verify KTP Length Error

Verify New Family Member from Card
    [Arguments]     ${ktp}
    Verify Home Page
    Go To Saling Jaga
    Verify Saling Jaga Screen
    Go To Keanggotaan
    Verify Keanggotaan Screen
    Click Lainnya Tab
    Click Verify Last Family Card
    Verify Verification Keanggotaan Screen
    Input Full Name
    Input KTP Number            ${ktp}
    PageKeanggotaan.Click Lanjut Button
    Verify Verification TnC Screen
#    Click Agreement Checklist

Family Members Redonate
    Verify Home Page
    Go To Saling Jaga
    Verify Saling Jaga Screen
    Go To Keanggotaan
    Verify Keanggotaan Screen
    Click Lainnya Tab
    Click Donasi Lagi Last Family Card
    PageKeanggotaan.Click Lanjut Button
    Input Donation Amount               10000
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               Dompet Kebaikan
    PageCampaignDetail.Click on Donasi Button
    Validate Summary Instant Payment
    Click Back to Campaign
