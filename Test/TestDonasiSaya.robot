*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageDonasiSaya.robot

*** Keywords ***
Verify My Donation Page
    Verify Home Page
    Go To My Donation
    Verify Donasi Saya Screen
    
See Donation History
    Verify My Donation Page
    Click See All Donation
    Verify Catatan Kebaikan Screen
    See All History Donation
