*** Settings ***
Library     RequestsLibrary
Library     DateTime
Library     json
Library     String
Library     Collections
Library     RedisLibrary
Resource    ../../Var/var.robot
Resource    ../../Config/config.robot
Resource    ../../Utils/testrails.robot

*** Variable ***
${istestrail}               false
${testrailtoken}            token
${finaltestrailtoken}=      Basic     ${testrailtoken}

*** Keywords ***
Testrail Preparation
    ${redis_conn}          Connect To Redis        35.240.132.153      8001

    Set To Redis    ${redis_conn}      istestrail    ${istestrail}
    Set To Redis    ${redis_conn}      testrailtoken    ${finaltestrailtoken}
    ${runid}=       Test Run Preparation    ${finaltestrailtoken}        ${15}    ${30}      Android
    Set To Redis    ${redis_conn}      testrunid    ${runid}

*** Test Case ***
Test Run Preparation

    Run Keyword IF      '${istestrail}' == 'true'     Testrail Preparation
    ...    ELSE     Log     do nothing
