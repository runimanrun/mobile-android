*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageCampaignDetail.robot

*** Keywords ***
Validate Banner is Clickable
    Verify Banner Section
    Click Banner Image

Validate All Images on Banner
    Verify Banner Section
    Swipe on Banner Image

Return to Home Page from Banner Detail
    Validate User Directed to Campaign Detail Page Properly
    Click Back on Navbar
    Verify Banner Section
