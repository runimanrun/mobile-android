*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     json
Library     String
Resource    ../utils/config.robot

*** Keywords ***
Get OTP Disburse
    [Arguments]     ${env}      ${disbid}

    ${auth}=    Create List     sdet      k1tab1sa
    Create Session  baseurl     ${qa_baseurl}     auth=${auth}
    ${resp}=    Get Request     baseurl     /otp/disburse/${env}/${disbid}
    
    Should Be Equal As Strings    ${resp.status_code}    200

    ${otp}=    get value from json     ${resp.json()}     $.otp
    ${finalotp}=      Get Substring   s${otp}    2   -1
    Log To Console      ${finalotp}

    ${txid}=    get value from json     ${resp.json()}     $.transactionid
    ${finaltxid}=      Get Substring   s${txid}    3   -2
    Log To Console      ${finaltxid}

    [return]     ${finaltxid}       ${finalotp}
