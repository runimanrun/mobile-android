*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageZakat.robot
Resource    ../PageObject/PagePaymentMethod.robot
Resource    TestZakat.robot

*** Keywords ***
Validate Navbar Menu on Home Page
    Verify Home Page

Validate All Tiles Menu
    Verify Tiles Menu

Validate Donation Tile
    Verify Donation Tile

Validate Zakat Tile
    Go To Zakat

Validate Saling Jaga Tile
    Verify Saling Jaga Tile

Validate Galang Dana Tile
    Verify Galang Dana Tile

Validate Wajib Zakat Section
    Verify Wajib Zakat Section
    Verify Ayat Quran

Hitung Ulang Zakat
    [Arguments]     ${income}       ${addIncome}        ${debt}
    Hitung Ulang Zakat penghasilan
    Change Income  ${income}  ${addIncome}  ${debt}

Verify Bayar Zakat
    [Arguments]                  ${organization}    ${paymentMethod}
    Click Bayar Zakat from Home Page
    Zakat Amount Result
    Zakat Process                ${organization}     ${paymentMethod}

Validate Cancel Wajib Zakat
    Close Zakat Section
    Choose Reason Close Zakat

Validate Saling Jaga Section
    Saling Jaga Section

Validate Donasi Paling Cocok Section
    Donasi Paling Cocok Section

Choose Campaign from Donasi Paling Cocok
    First Donasi Paling Cocok View

Give Recomendation
    [Arguments]            ${comment}
    Donasi Paling Cocok Section
    Give Recomendation Rate        ${comment}

Validate Donasi Navbar
    Go To Home
