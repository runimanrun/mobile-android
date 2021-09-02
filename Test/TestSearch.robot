*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageSearch.robot

*** Keywords ***
Verify Search Page
    Verify Home Page
    Click Search Bar
    Verify Search Screen
    Verify Last Keyword Search

Search Any Campaign
    [Arguments]             ${keyword}
    Verify Search Page
    Input Search Box        ${keyword}
    Verify Search Result
    Choose Result Campaign Search
    Validate User Directed to Campaign Detail Page Properly

Clear Search Result
    [Arguments]             ${keyword}
    Verify Search Page
    Input Search Box        ${keyword}
    Verify Search Result
    Click Clear Search Box
    Verify Clear Search Result
    Click Back from Search

Clear History Keyword
    Verify Search Page
    Delete Keyword History
