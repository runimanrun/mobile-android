*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Test/TestDonation.robot
Resource    ../PageObject/PageCampaignDetail.robot
Resource    ../PageObject/PageLaporPenggalangan.robot

*** Keywords ***
Go to Campaign Detail
    Choose Campaign
    Validate User Directed to Campaign Detail Page Properly

Verify All Section on Campaign Detail
    Validate Top Menu
    Validate Info Penggalang Dana section is Showing
    Validate Pasien Name section is Showing
    Validate Penyalur or Penerima Dana
    Validate Cerita Section
    Go to News Update
    Verify Doa Section on Campaign Detail
    Verify Donor List
    Validate Fundraiser is Exist
    Validate Share Campaign Section

Add Campaign to Love List
    Go to Campaign Detail
    Click Love Icon

Verify News Update
    Go to Campaign Detail
    Go to News Update

Sort Donor List with The Most
    Go to Campaign Detail
    Verify Donor List
    Sort The Most Donor List

Validate Doa Section
    Verify Doa Section on Campaign Detail
    Verify Doa List is Exist

Sort Doa List
    Verify Sorting Doa on Campaign Detail

Go to Fundraiser Page
    Validate Fundraiser is Exist

Verify Penggalang Dana Page
    Validate Info Penggalang Dana section is Showing
    Go to Penggalang Dana Section
    Verify Penggalang Page

Go to Cerita Lengkap
    Validate Cerita Section
    Verify Baca Selengkapnya Is Clickable
    Verify Sembunyikan Cerita

Go to All Donor List
    Verify Donor List
    Click Button Show More Donors List

Go to Report Penggalangan Page
    Validate Top Menu
    Click Option Report Penggalangan

Fill Detail Report Penggalangan
    [Arguments]         ${name}     ${phone}        ${email}        ${comment}
    Input Name to Report Penggalangan       ${name}
    Input Phone to Report Penggalangan      ${phone}
    Input Email to Report Penggalangan      ${email}
    Input Detail Report                     ${comment}
    Send Report Penggalangan
