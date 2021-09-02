*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageFavorite.robot
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageCampaignDetail.robot

*** Keywords ***
Navigate to Favorite
    Click Love List Button
    Verify Love List Page
    Change Layout to Grid View

Validate Empty Love List Page
    Navigate to Favorite
    Verify Empty Love List

Remove Campaign from List
    Click Love List Button
    Verify Love List Page
    Click First Campaign on Favorite List
    Click Love Icon

Verify Individual Medical Campaign Case One
    Click Love List Button
    Verify Love List Page
    Click First Campaign on Favorite List
    Validate Info Penggalang Dana section is Showing
    Validate Pasien Name section is Showing
    Validate Diagnosis section is Showing
    Click on Back Button

Verify Individual Medical Campaign Case Two
    Click Love List Button
    Verify Love List Page
    Click First Campaign on Favorite List
    Validate Info Penggalang Dana section is Showing
    Validate Pasien Name section is Showing
    Validate Diagnosis section is Showing
    Verify Baca Selengkapnya Button Is Showing
    Verify Baca Selengkapnya Is Clickable
