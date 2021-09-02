*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot
Resource    ../PageObject/PageTopup.robot
Resource    ../PageObject/PagePaymentMethod.robot
Resource    ../PageObject/PageSummary.robot

*** Keywords ***
Validate Wallet Section on Homepage
    Get Wallet Balance

Validate Topup Wallet on Homepage
    Verify Topup Wallet
    Verify Topup Saldo Screen

Validate Wallet on Account
    Go To Account
    Verify Account Page
    Get Wallet Balance

Validate Wallet History
    Validate Wallet on Account
    Click Wallet on Account
    Verify Last Wallet Transaction
    Verify Wallet List History

Validate Pending Topup Transaction
    Verify Home Page
    Click Topup Saldo Button
    Verify Topup Saldo Screen
    Input Topup Amount                  10000
    Click Payment Method
    Select Payment Method               bca
    Click Topup Saldo Button
    Validate User Redirected to Summary Page Properly
    Click Copy Account Number
    Validate Account Number Has Been Copied
    Click Back Button on Top Navbar
    Verify Home Page

Cancel Topup Dompet Kebaikan
    Verify Home Page
    Verify Wallet Topup Pending Status
    Click Topup Saldo Button
    Close the Pop Up
    Validate User Redirected to Summary Page Properly
    Click Cancel Topup Button
    Confirm Cancel Topup
    Verify Home Page
