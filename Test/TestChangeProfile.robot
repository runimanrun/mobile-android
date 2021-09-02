*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot
Resource    ../PageObject/PageProfile.robot
Resource    ../Test/TestSubMenuAkun.robot

*** Keywords ***
Account Profile
    Validate Account Page
    Click Profile
    Click Edit Profile Button
    Verify Edit Profile Page

Cancel Edit Profile Process
    Account Profile
    Click Cancel Edit Button
    Confirm Cancel Edit Profile

Change Account Profile
    [Arguments]     ${profileName}      ${profileBio}
    Account Profile
    Input Profile Name          ${profileName}
    Input Profile Bio          ${profileBio}
    PageProfile.Click Save Button
