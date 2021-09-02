#/otp/del/stg/6281280649328
*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     json
Library     String
Resource    ../utils/config.robot

*** Keywords ***
Remove OTP Counter
    [Arguments]     ${env}      ${username}

    ${auth}=    Create List     sdet      k1tab1sa
    Create Session  baseurl     ${qa_baseurl}     auth=${auth}
    ${resp}=    Get Request     baseurl     /otp/del/${env}/${username}
    
    Should Be Equal As Strings    ${resp.status_code}    200

    ${status}=    get value from json     ${resp.json()}     $.status
    ${finalstatus}=      Get Substring    s${status}    2   -1
    Log To Console      ${finalstatus}

    FOR     ${i}    IN RANGE    10
        Exit For Loop If    ${finalstatus} == True
        Log    ${finalstatus}
    END
    Log    Exited
