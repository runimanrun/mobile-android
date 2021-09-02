*** Settings ***
Library     RequestsLibrary
Library     DateTime
Library     json
Library     String
Library     Collections
Resource    ../Var/var.robot

*** Keywords ***
Test Run Preparation
    [Arguments]     ${usertoken}        ${projectid}    ${suiteid}      ${platform}

    ${d}=    Get Current Date    result_format=%Y-%m-%d %H:%M
    log    {d}
    ${testrunname}=     Catenate        Test Run Regression      ${platform}     ${d}
    ${header}=  Create Dictionary       Content-Type=application/json       Authorization=${usertoken}
    ${body}=    Create Dictionary       suite_id=${suiteid}     include_all=true    name=${testrunname}

    ${JSON_STRING}=     json.dumps      ${body}
    ${JSON_STRING}=     Replace String      ${JSON_STRING}       "true"      true
    
    Create Session  baseurl     https://kitabisa.testrail.io        verify=true
    ${resp}=    Post Request     baseurl     /index.php?/api/v2/add_run/${projectid}       data=${JSON_STRING}      headers=${header}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${resptestrunid}=           get value from json     ${resp.json()}     $.id
    ${finalresptestrunid}=      Get Substring   s${resptestrunid}    2   -1
    Set Suite Variable     ${testrunid}    ${finalresptestrunid}

    [return]        ${finalresptestrunid}

Add Test Result
    [Arguments]     ${usertoken}    ${testrunid}    ${caseid}    ${statusid}      ${comment}

    ${header}=  Create Dictionary       Content-Type=application/json       Authorization=Basic ${usertoken}
    ${body}=    Create Dictionary       status_id=${statusid}     comment=${comment}
    
    Create Session  baseurl     https://kitabisa.testrail.io        verify=true
    ${resp}=    Post Request     baseurl     /index.php?/api/v2/add_result_for_case/${testrunid}/${caseid}       data=${body}      headers=${header}

    Should Be Equal As Strings    ${resp.status_code}    200

Update Status
    [Arguments]             ${status}       ${caseid}       ${message}
    ${redis_conn}           Connect To Redis        35.240.132.153      8001
    ${confistestrail}=      Get From Redis      ${redis_conn}       istestrail

    Run Keyword IF          '${status}' == 'PASS' and '${confistestrail}' == 'true'     Passed Update       ${redis_conn}               ${caseid}     ${message}
    ...    ELSE IF          '${status}' != 'PASS' and '${confistestrail}' == 'true'     Failed Update       ${redis_conn}               ${caseid}     ${message}

Failed Update
    [Arguments]     ${redis_conn}       ${caseid}       ${comment}

    #${redis_conn}           Connect To Redis        35.240.132.153      8001
    ${gettestrunid}=        Get From Redis      ${redis_conn}       testrunid
    ${gettestrailtoken}=    Get From Redis      ${redis_conn}       testrailtoken

    Add Test Result         ${gettestrailtoken}        ${gettestrunid}    ${caseid}    5       ${comment}
    Fail    failed

Passed Update
    [Arguments]     ${redis_conn}       ${caseid}       ${comment}

    #${redis_conn}           Connect To Redis        35.240.132.153      8001
    ${gettestrunid}=        Get From Redis      ${redis_conn}       testrunid
    ${gettestrailtoken}=    Get From Redis      ${redis_conn}       testrailtoken

    Add Test Result         ${gettestrailtoken}        ${gettestrunid}    ${caseid}    1       ${comment}

    ### USAGE ###
    # Resource    ../../Utils/testrails.robot

    # *** Variable ***
    # ${testrailtoken}      token
    # ${finaltestrailtoken}=     Basic     ${testrailtoken}

    # *** Test Case ***
    # Test Run Preparation
    #     Test Run Preparation    ${finaltestrailtoken}        ${15}    ${46}      Kanvas
    #     Add Test Result         ${finaltestrailtoken}        ${testrunid}    7108    1       test from RF
