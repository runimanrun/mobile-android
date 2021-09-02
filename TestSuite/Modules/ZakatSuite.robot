*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestDonation.robot
Resource    ../../Test/TestDompetKebaikan.robot
Resource    ../../Test/TestZakat.robot
Resource    ../../Test/TestSalingJaga.robot
Resource    ../../Var/var.robot
Resource    ../../Utils/testrails.robot
Resource    ../../Test/TestHome.robot

Suite Setup         Start Application
Test Setup          Launch Application
Test Teardown       Update Status       ${TEST STATUS}      ${TEST DOCUMENTATION}       ${TEST MESSAGE}
Suite Teardown      After Suite

*** Keywords ***
After Suite
    Remove Application      com.kitabisa.android.staging
    Close Application

*** Test Case ***
User Login with Email and Password
    [Tags]      login       regression      positive
    Login with Email and Password               ${zakatEmail}     ${zakatPassword}

C3729 User Distribute Zakat with Amount Less Than Minimum Required using Bank Transfer
    [Tags]      zakat       regression      negative
    [Documentation]     ${3729}
    Distribute Zakat with Amount Less Than Minimum Required     Rumah Zakat       bca

C3730 User Distribute Zakat to Organization using BCA Bank Transfer
    [Tags]      zakat       regression      positive
    [Documentation]     ${3730}
    Distribute Zakat to Organization                Rumah Zakat       bca    15000

C3731 User Distribute Zakat to Organization using Mandiri Bank Transfer
    [Tags]      zakat       regression      positive
    [Documentation]     ${3731}
    Distribute Zakat to Organization                Rumah Zakat         mandiri    10000

C3732 User Distribute Zakat to Organization using BNI Bank Transfer
    [Tags]      zakat       regression      positive
    [Documentation]     ${3732}
    Distribute Zakat to Organization                Rumah Zakat         bni    11000

C3733 User Distribute Zakat to Organization using BRI Bank Transfer
    [Tags]      zakat       regression      positive
    [Documentation]     ${3733}
    Distribute Zakat to Organization                Rumah Zakat       bri    12000

C3724 User Distribute Zakat with Amount Less Than Minimum Required using Virtual Account
    [Tags]      zakat       regression      negative
    [Documentation]     ${3724}
    Distribute Zakat with Amount Less Than Minimum Required     Rumah Zakat       vabca

C3725 User Distribute Zakat to Organization using BCA Virtual Account
    [Tags]      zakat       regression      positive
    [Documentation]     ${3725}
    Distribute Zakat to Organization                Rumah Zakat       vabca    13000

C3726 User Distribute Zakat to Organization using Mandiri Virtual Account
    [Tags]      zakat       regression      positive
    [Documentation]     ${3726}
    Distribute Zakat to Organization                Rumah Zakat         vamandiri    14000

C3727 User Distribute Zakat to Organization using BNI Virtual Account
    [Tags]      zakat       regression      positive
    [Documentation]     ${3727}
    Distribute Zakat to Organization                Rumah Zakat         vabni    15000

C3728 User Distribute Zakat to Organization using BRI Virtual Account
    [Tags]      zakat       regression      positive
    [Documentation]     ${3728}
    Distribute Zakat to Organization                Rumah Zakat       vabri    16000

C3722 User Calculate Zakat Profesi
    [Tags]      zakat       regression      positive
    [Documentation]     ${3722}
    Calculate Zakat Profesi                         Rumah Zakat         mandiri

C3723 User Calculate Zakat Maal
    [Tags]      zakat       regression      positive
    [Documentation]     ${3723}
    Calculate Zakat Maal                            Rumah Zakat         bri

C3734 User Zakat on Spesific Campaign
    [Tags]      zakat       regression      positive
    [Documentation]     ${3734}
    Distribute Zakat on Spesific Campaign           bca

C3735 User Distribute Zakat to Verified Organization
    [Tags]      zakat       regression      positive
    [Documentation]     ${3735}
    Distribute Zakat to Organization                Rumah Zakat       bca    10000

C3736 User Distribute Zakat to Unverified Organization
    [Tags]      zakat       regression      positive
    [Documentation]     ${3736}
    Distribute Zakat to Organization                Zakat Kita Nurul Hayat       mandiri    11000

C3737 User Calculate Zakat Profesi with Nisab Less Than Minimum Required
    [Tags]      zakat       regression      negative
    [Documentation]     ${3737}
    Calculate Zakat Profesi with Nisab Less Than Minimum Required

C3738 User Calculate Zakat Profesi with Nisab Meet Minimum Required
    [Tags]      zakat       regression      negative
    [Documentation]     ${3738}
    Calculate Zakat Profesi with Nisab Meet Minimum Required

C3739 User Calculate Zakat Maal with Nisab Less Than Minimum Required
    [Tags]      zakat       regression      negative
    [Documentation]     ${3739}
    Calculate Zakat Maal with Nisab Less Than Minimum Required

C3740 User Calculate Zakat Maal with Nisab Meet Minimum Required
    [Tags]      zakat       regression      negative
    [Documentation]     ${3740}
    Calculate Zakat Maal with Nisab Meet Minimum Required
