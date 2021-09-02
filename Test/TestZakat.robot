*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageZakat.robot
Resource    ../PageObject/PageCalculatorZakat.robot
Resource    ../PageObject/PagePaymentMethod.robot
Resource    ../PageObject/PageSummary.robot
Resource    ../PageObject/PageCampaignDetail.robot

*** Keywords ***
Distribute Zakat with Amount Less Than Minimum Required
    [Arguments]     ${organization}     ${paymentMethod}
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Salurkan Button
    Verify Distribute Zakat Popup
    Input Zakat Amount                  10000
    Choose Zakat Organization           ${organization}
    Click on Payment Method
    Select Payment Method               ${paymentMethod}
    Input Zakat Amount                  1000
    Click Bayar Zakat Button
    Validate Zakat with Minimum Amount Required

Distribute Zakat to Organization
    [Arguments]     ${organization}     ${paymentMethod}    ${amount}
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Salurkan Button
    Verify Distribute Zakat Popup
    Input Zakat Amount              ${amount}
    Zakat Process               ${organization}     ${paymentMethod}

Distribute Zakat on Spesific Campaign
    [Arguments]     ${paymentMethod}
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click First Spesific Zakat
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    PageCampaignDetail.Input Donation Amount    10000
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method           ${paymentMethod}
    Click Continue Payment
    Verify Summary Zakat

Calculate Zakat Profesi
    [Arguments]     ${organization}     ${paymentMethod}
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Calculator Button
    Verify Calculator Zakat Screen
    Input Monthly Income            4000000
    Input Other Income              1500000
    Input Debt Installment          2000000
    Click Calculate Zakat Button
    Verify Calculated Zakat Profesi Popup
    Zakat Process               ${organization}     ${paymentMethod}

Calculate Zakat Maal
    [Arguments]     ${organization}     ${paymentMethod}
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Calculator Button
    Verify Calculator Zakat Screen
    Click on Zakat Maal Tab
    Input Deposito Amount           50000000
    Input Property Amount           20000000
    Input Personal Debt Amount      5000000
    Click Calculate Zakat Button
    Verify Calculated Zakat Maal Popup
    Zakat Process               ${organization}     ${paymentMethod}

Zakat Process
    [Arguments]     ${organization}     ${paymentMethod}
    Choose Zakat Organization       ${organization}
    Click on Allow Contacted
    Click on Payment Method
    Select Payment Method           ${paymentMethod}
    Click Bayar Zakat Button
    Verify Summary Zakat

Verify Summary Zakat
    Close the Pop Up
    Validate User Redirected to Summary Page Properly
    Click Copy Account Number
    Validate Account Number Has Been Copied
    Click Back to Campaign

Calculate Zakat Profesi with Nisab Less Than Minimum Required
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Calculator Button
    Verify Calculator Zakat Screen
    Input Monthly Income            30
    Click Calculate Zakat Button
    Verify Calculated Zakat Nisab Not Reached

Calculate Zakat Profesi with Nisab Meet Minimum Required
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Calculator Button
    Verify Calculator Zakat Screen
    Input Monthly Income            6000000
    Click Calculate Zakat Button
    Verify Calculated Zakat Nisab Reached Amount Required

Calculate Zakat Maal with Nisab Less Than Minimum Required
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Calculator Button
    Verify Calculator Zakat Screen
    Click on Zakat Maal Tab
    Input Deposito Amount           100000
    Click Calculate Zakat Button
    Verify Calculated Zakat Nisab Not Reached

Calculate Zakat Maal with Nisab Meet Minimum Required
    Verify Home Page
    Go To Zakat
    Verify Zakat Screen
    Click on Calculator Button
    Verify Calculator Zakat Screen
    Click on Zakat Maal Tab
    Input Deposito Amount           80000000
    Click Calculate Zakat Button
    Verify Calculated Zakat Nisab Reached Amount Required
