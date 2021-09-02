*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot
Resource    ../PageObject/PageSettings.robot
Resource    ../PageObject/PageReminder.robot

*** Keywords ***
Validate Setting Page
    Go To Account
    Verify Account Page
    Click Settings
    Verify Settings Page

Set As Anonym for Donation
    Validate Setting Page
    Click Donate as Anonim

Set Donation Monthly Reminder
    Go To Account
    Verify Account Page
    Click Switch Reminder Donation
    Verify Reminder Donation Screen
    Click Month Frequency
    Select Monthly Frequency
    Click Save Reminder Button
    Verify Success Set Reminder
    Click Switch Reminder Donation

Verify Toggle Zakat Setting Is Active
    Go To Account
    Verify Account Page
    repeat keyword  2 times     Click Switch Zakat Setting
    Select Zakat Period
    Input Zakat Income              10000000
    Input Zakat Other Income        1000000
    Input Zakat Debt Installment    500000
    Verify Lanjut Button Is Visible
    Verify Account Page

Verify Change Account
    Validate Setting Page
    Click Change Account
    Cancel Change Account
