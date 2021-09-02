*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestDonation.robot
Resource    ../../Test/TestDompetKebaikan.robot
Resource    ../../Test/TestZakat.robot
Resource    ../../Test/TestSalingJaga.robot
Resource    ../../Test/TestFavorite.robot
Resource    ../../Var/var.robot
Resource    ../../Utils/testrails.robot
Resource    ../../Test/TestDonasiRutin.robot
Resource    ../../Test/TestRegister.robot
Resource    ../../Test/TestCampaignDetail.robot
Resource    ../../Test/TestDoa.robot

Suite Setup         Start Application
Test Setup          Launch Application
#Test Teardown       Update Status       ${TEST STATUS}      ${TEST DOCUMENTATION}       ${TEST MESSAGE}
Suite Teardown      After Suite

*** Keywords ***
After Suite
#    Remove Application      com.kitabisa.android.staging
    Close Application

*** Test Case ***
#User Login with Email and Password
#    [Tags]      login       regression      positive
#    Login with Email and Password               ${donationEmail}        ${donationPassword}

C16011 User cannot donate without input amount
    [Tags]    donation    regression     negative
    [Documentation]    ${16011}
    Choose Campaign
    Donation without amount    

C15976 User cannot donate with amount less than 1000
    [Tags]    donation    regression     negative
    [Documentation]    ${16011}
    Choose Campaign
    Donation below 1000    500

C15977 User cannot donate with amount not in multiple thousands
    [Tags]    donation    regression     negative
    [Documentation]    ${16011}
    Choose Campaign
    Donation not in multiple thousands    5001

C15978 User cannot donate without select payment method
    [Tags]    donation    regression     negative
    [Documentation]    ${16011}
    Choose Campaign
    Donation without select payment method    10000

C3711 User Create Bank Donation Using Bank Transfer with Amount Less Than Minimum Required
    [Tags]      donation        regression      negative
    [Documentation]     ${3711}
    Choose Campaign
    Create Bank Donation with Amount Less Than Minimum Required      5000    bca

C3705 User Create VA Donation Campaign Case Two Using VA with Amount Less Than Minimum Required
    [Tags]      donation        regression      negative
    [Documentation]     ${3705}
    Choose Campaign
    Create VA Donation with Amount Less Than Minimum Required      5000    vabca

C3712 User Create Donation Using Bank Transfer with Minumum Amount Required
    [Tags]      donation        regression      positive
    [Documentation]     ${3712}
    Choose Campaign
    Create Bank Donation        10000       bri

C3713 User Create Bank Donation using BCA
    [Tags]      donation        regression      positive
    [Documentation]     ${3713}
    Choose Campaign
    Create Bank Donation        14000       bca

C3714 User Create Bank Donation using Mandiri
    [Tags]      donation        regression      positive
    [Documentation]     ${3714}
    Choose Campaign
    Create Bank Donation        15000       mandiri

C3715 User Create Bank Donation using BNI
    [Tags]      donation        regression      positive
    [Documentation]     ${3715}
    Choose Campaign
    Create Bank Donation        16000       bni

C3716 User Create Bank Donation using BNI Syariah
    [Tags]      donation        regression      positive
    [Documentation]     ${3716}
    Choose Campaign
    Create Bank Donation        17000       bnis

C3717 User Create Bank Donation using BRI
    [Tags]      donation        regression      positive
    [Documentation]     ${3717}
    Choose Campaign
    Create Bank Donation        18000       bri

C3706 User Create Donation Using VA with Minumum Amount Required
    [Tags]      donation        regression      positive
    [Documentation]     ${3706}
    Choose Campaign
    Create VA Donation          10000       vamandiri

C3708 User Create VA Donation using VA BCA
    [Tags]      donation        regression      positive
    [Documentation]     ${3708}
    Choose Campaign
    Create VA Donation          12000       vabca

C3709 User Create VA Donation using VA BNI
    [Tags]      donation        regression      positive
    [Documentation]     ${3709}
    Choose Campaign
    Create VA Donation          13000       vabni

C3710 User Create VA Donation using VA BRI
    [Tags]      donation        regression      positive
    [Documentation]     ${3710}
    Choose Campaign
    Create VA Donation          14000       vabri

C3707 User Create VA Donation using VA Mandiri
    [Tags]      donation        regression      positive
    [Documentation]     ${3707}
    Choose Campaign
    Create VA Donation          15000       vamandiri

C12679 User Validate Individual Medical Campaign Case 1
    [Documentation]     ${12679}
    Verify Individual Medical Campaign Case One

C12680 User Validate Individual Medical Campaign Case 2
    [Documentation]     ${12680}
    Verify Individual Medical Campaign Case Two

C9005 Verify Parent Campaign Detail Section
    [Tags]      campaign detail        regression
    [Documentation]         ${9005}
    Go to Campaign Detail
    Verify All Section on Campaign Detail

C9006 Verify Child Campaign Detail Section
    [Tags]      campaign detail        regression
    [Documentation]         ${9006}
    Go to Campaign Detail
    Go to Fundraiser Page

C9008 Verify Penggalang Dana Detail Page
    [Tags]      campaign detail        regression
    [Documentation]         ${9008}
    Go to Campaign Detail
    Verify Penggalang Dana Page

C9009 Verify Baca Selengkapnya Cerita Section
    [Tags]      campaign detail        regression
    [Documentation]         ${9009}
    Go to Campaign Detail
    Go to Cerita Lengkap

C9012 Validate Doa on Campaign Detail
    [Tags]      doa        regression
    [Documentation]         ${9012}
    Go to Campaign Detail
    Validate Doa Section

C9013 Do Amiin Doa on Campaign Detail
    [Tags]      doa        regression
    [Documentation]         ${9013}
    Go to Campaign Detail
    Validate Doa Section
    Amiinkan Doa

C9014 Share Doa on Campiagn Detail
    [Tags]      doa        regression
    [Documentation]         ${9014}
    Go to Campaign Detail
    Validate Doa Section
    Share Doa

C9015 Report/Delete Doa on Campaign Detail
    [Tags]      doa        regression
    [Documentation]         ${9015}
    Go to Campaign Detail
    Validate Doa Section
    Verify Laporkan Doa

C9016 Change Filter Doa on Campaign Detail
    [Tags]      doa        regression
    [Documentation]         ${9016}
    Go to Campaign Detail
    Validate Doa Section
    Sort Doa List

C9018 Lihat Semua Doa on Campaign Detail
    [Tags]      doa        regression
    [Documentation]         ${9018}
    Go to Campaign Detail
    Verify Lihat Semua Doa on Campaign Detail

C9019 Lihat Semua Donasi
    [Tags]      campaign detail        regression
    [Documentation]         ${9019}
    Go to Campaign Detail
    Go to All Donor List

C9023 Laporkan Penggalangan
    [Tags]      campaign detail         regression
    [Documentation]         ${9023}
    Go to Campaign Detail
    Go to Report Penggalangan Page
    SLeep   3s
    Fill Detail Report Penggalangan     QA Tester       0859106963592       teta.kibites@gmail.com      test report galang dana with reason penyalahgunaan dana

User Logout
    Logout Process

User Register with Phone Number
    [Tags]      login       regression      donasi rutin      positive
    Register with Email                                      ${donasiRutinUser}         ${nameToRegis}

C3748 Verify About Donasi Rutin
    [Tags]      donasi rutin        regression
    [Documentation]         ${3748}
    Validate Go to Donasi Rutin
    Validate Donasi Rutin Page Show Properly

C6351 Create Donasi Rutin to Any Campaign
    [Tags]      donasi rutin        regression
    [Documentation]         ${6351}
    Validate Go to Donasi Rutin
    Validate Donasi Rutin Page Show Properly
    Donate to Donasi Rutin
    Input Donasi Rutin Amount        13000
    Choose Donasi Rutin Payment
    Confirm Donasi Rutin

C6352 Update Donasi Rutin Data
    [Tags]      donasi rutin        regression
    [Documentation]         ${6352}
    Validate Go to Donasi Rutin
    Validate Donasi Rutin Page Show Properly
    Donate to Donasi Rutin
    Change Data Donasi Rutin which set      15000

C6353 Delete Donasi Rutin Data
    [Tags]      donasi rutin        regression
    [Documentation]         ${6353}
    Validate Go to Donasi Rutin
    Validate Donasi Rutin Page Show Properly
    Donate to Donasi Rutin
    Delete Data Donasi Rutin which set
