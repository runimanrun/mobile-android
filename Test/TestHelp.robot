*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot
Resource    ../PageObject/PageHelp.robot
Resource    ../PageObject/PageTnc.robot

*** Keywords ***
Navigate to Help Page
    Go To Account
    Verify Account Page
    Click Help
    Verify Help Page

Navigate to Campaigner Page
    Navigate to Help Page
    Click Frequently Ask Question
    Verify Help Center Title
    Scroll Down Tnc Page
    Click Campaigner Text View

Navigate to Donatur Page
    Navigate to Help Page
    Click Frequently Ask Question
    Verify Help Center Title
    Scroll Down Tnc Page
    Click Donatur Text View

Navigate to General Page
    Navigate to Help Page
    Click Frequently Ask Question
    Verify Help Center Title
    Scroll Down Tnc Page
    Click General Text View

Send Question with Invalid Email Format
    [Arguments]     ${phoneNumber}      ${email}
    Navigate to Help Page
    Click Contact Us via Email
    Verify Help Contact Us Page
    Input Phone Number                  ${phoneNumber}
    Input Email                         ${email}
    Validate Invalid Email Format

Send Question with Message Under 30 Chars
    [Arguments]     ${phoneNumber}      ${email}        ${questionMessage}
    Navigate to Help Page
    Click Contact Us via Email
    Verify Help Contact Us Page
    Input Phone Number                  ${phoneNumber}
    Input Email                         ${email}
    Input Question Advice               ${questionMessage}
    Validate Minimum Char Question

Send Question Message
    [Arguments]     ${phoneNumber}      ${email}        ${questionMessage}
    Navigate to Help Page
    Click Contact Us via Email
    Verify Help Contact Us Page
    Input Phone Number                  ${phoneNumber}
    Input Email                         ${email}
    Select Topic Option
    Select Issue Option
    Input Question Advice               ${questionMessage}
    PageHelp.Click Send Button
    Vefify Message Sent
    Click Popup Back Button
