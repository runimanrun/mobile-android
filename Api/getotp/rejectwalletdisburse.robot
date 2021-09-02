*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
Resource    ../utils/config.robot

*** Keywords ***
Reject Wallet Disburse
    [Arguments]     ${env}      ${status}     ${txid}

    ${auth}=    Create List     sdet      k1tab1sa
    Create Session  baseurl     ${qa_baseurl}      auth=${auth}

    ${body}=    Create Dictionary       env=${env}      status=${status}    transactionid=${txid}
    ${header}=  Create Dictionary       Content-Type=application/json

    ${resp}=    Post Request     baseurl     /updatedisburse      data=${body}    headers=${header}

    log     ${resp}

    ${status}=    get value from json     ${resp.json()}     $.status

    :FOR    ${i}    IN RANGE    10
    \    Exit For Loop If    ${status} == [True]
    \    Log    ${status}
    Log    Exited

    Should Be Equal As Strings    ${resp.status_code}    200
