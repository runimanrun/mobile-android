*** Settings ***
Library     AppiumLibrary
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageDoa.robot
Resource    ../PageObject/PageCampaignDetail.robot

*** Keywords ***
Validate Section Doa on Home Page
    Verify Doa Section

Validate Lihat Semua Doa
    Verify Lihat Doa Lainnya
    Go Back
    Verify Semua Doa

View First Doa
    Choose First Doa
    Verify Doa Layout Show Properly

Go to Campaign Page
    Click Campaign Name
    Validate User Directed to Campaign Detail Page Properly

Do Laporkan Doa
    [Arguments]             ${comment}
    Laporkan Doa            ${comment}

Amiinkan Doa
    Verify Amiin Doa

Share Doa
    Verify Share Doa
    Go Back

Verify Laporkan Doa
    Lapor or Delete Doa
    Verify Report Option

Verify Amiinkan Doa Lainnya
    Amiinkan Doa Lainnya

Verify Lihat Doa Saya
    Click Tab Doa saya
    Lihat Doa Saya

Verify Sorting Doa
    Click Sorting Button
    Verify Sorting Option

Verify Delete Doa Saya
    Lapor or Delete Doa
    Confirm Delete Doa Saya

Create Doa
    [Arguments]     ${amount}       ${paymethod}        ${doa}
    Validate User Directed to Campaign Detail Page Properly
    PageCampaignDetail.Click on Donasi Button
    Input Donation Amount               ${amount}
    PageCampaignDetail.Click on Payment Method options
    Select Payment Method               ${paymethod}
    Input Doa                           ${doa}
    Click Continue Payment

Verify Lihat Semua Doa on Campaign Detail
    Lihat Semua Doa on Campaign Detail
