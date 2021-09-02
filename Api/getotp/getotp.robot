*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     json
Library     String
Resource    ../utils/config.robot

*** Keywords ***
Get OTP
    [Arguments]     ${env}      ${channel}      ${type}     ${username}

    ${auth}=    Create List     sdet      k1tab1sa
    Create Session  baseurl     ${qa_baseurl}     auth=${auth}
    ${resp}=    Get Request     baseurl     /otp/${env}/${channel}/${type}/${username}
    
    Should Be Equal As Strings    ${resp.status_code}    200

    ${otp}=    get value from json     ${resp.json()}     $.otp
    ${finalotp}=      Get Substring   s${otp}    3   -2
    Log To Console      ${finalotp}

    [return]    ${finalotp}
