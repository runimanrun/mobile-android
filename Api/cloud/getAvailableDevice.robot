*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
Library     BuiltIn
Library     Collections
Resource    ../utils/config.robot

*** Keywords ***
Get Available Device
    ${auth}=    Create List     ${usernameCloud}      ${apiKeyCloud}
    Create Session  baseurl     https://api-cloud.browserstack.com     auth=${auth}     verify=true
    ${resp}=    Get Request     baseurl     /app-automate/devices.json

    ${PABOTQUEUEINDEX}=     run keyword if      '${PABOTQUEUEINDEX}'=='${EMPTY}'    set variable    0
    ...     ELSE        set variable    ${PABOTQUEUEINDEX}

    ${response}=    convert string to json      ${resp.content}
    ${count}=       get length                  ${response}
    ${counter}=     set variable                ${EMPTY}

     FOR    ${index}    IN RANGE      ${count}

        ${osName}=          get value from json     ${response}[${index}]       os
        ${counter}=         run keyword if          '${osName[0]}'=='android'   set variable    ${index}
        ...     ELSE        set variable    ${EMPTY}

        exit for loop if    '${counter}'!='${EMPTY}'
     END

    ${counter}=             evaluate                ${index}+${PABOTQUEUEINDEX}
    ${deviceName}=          get value from json     ${response}[${counter}]       device
    ${osVersion}=           get value from json     ${response}[${counter}]       os_version

    log to console          Automation test will be running on ${deviceName[0]} with OS ${osVersion[0]}

    [Return]        ${deviceName[0]}        ${osVersion[0]}
