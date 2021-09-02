*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
Resource    ../utils/config.robot

*** Keywords ***
Invalidate Username
    [Arguments]     ${env}      ${type}     ${username}

    ${auth}=    Create List     sdet      k1tab1sa
    Create Session  baseurl     ${qa_baseurl}      auth=${auth}

    ${body}=    Create Dictionary       env=${env}      type=${type}    username=${username}
    ${header}=  Create Dictionary       Content-Type=application/json

    ${resp}=    Post Request     baseurl     /update      data=${body}    headers=${header}

    log     ${resp}

    ${status}=    get value from json     ${resp.json()}     $.status

    FOR     ${i}    IN RANGE    10
        Exit For Loop If    ${status} == [True]
        Log    ${status}
    END
    Log    Exited

    Log To Console      ${status}

    Should Be Equal As Strings    ${resp.status_code}    200
