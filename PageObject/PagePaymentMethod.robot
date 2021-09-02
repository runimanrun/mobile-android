*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
#Payment Method
${DOMPETKEBAIKAN}           xpath=//*[@text="Dompet Kebaikan"]
${VABCA}                    xpath=//*[@text="BCA Virtual Account"]
${VAMANDIRI}                xpath=//*[@text="Mandiri Virtual Account"]
${VABNI}                    xpath=//*[@text="BNI Virtual Account"]
${VABRI}                    xpath=//*[@text="BRI Virtual Account"]
${BCA}                      xpath=//*[@text="Transfer BCA"]
${MANDIRI}                  xpath=//*[@text="Transfer Mandiri"]
${BNI}                      xpath=//*[@text="Transfer BNI"]
${BRI}                      xpath=//*[@text="Transfer BRI"]
${BNIS}                     xpath=//*[@text="Transfer BNI Syariah"]

*** Keywords ***
Select Payment Method
    [Arguments]     ${method}
    wait until page contains        bayar
    ${vaPrefix}     get substring       ${method}       0       2
    run keyword if      '${method}'=='Dompet Kebaikan'      click element       ${DOMPETKEBAIKAN}
    ...     ELSE IF     '${vaPrefix}'=='va'     Select VA Payment Method        ${method}
    ...     ELSE        run keyword             Select Bank Payment Method      ${method}

Select Bank Payment Method
    [Arguments]     ${method}
    Long Scrolling Down            com.kitabisa.android.staging:id/recyclerView    2

    run keyword if      '${method}'=='bca'          Validate Maintenance Status     ${BCA}          ${method}
    ...     ELSE IF     '${method}'=='mandiri'      Validate Maintenance Status     ${MANDIRI}      ${method}
    ...     ELSE IF     '${method}'=='bnis'         Validate Maintenance Status     ${BNIS}         ${method}
    ...     ELSE IF     '${method}'=='bri'          Validate Maintenance Status     ${BRI}          ${method}
    ...     ELSE IF     '${method}'=='bni'          Validate Maintenance Status     ${BNI}          ${method}

Select VA Payment Method
    [Arguments]     ${method}
    Short Scrolling Down            com.kitabisa.android.staging:id/recyclerView    1

    run keyword if      '${method}'=='vabca'        Validate Maintenance Status     ${VABCA}          ${method}
    ...     ELSE IF     '${method}'=='vamandiri'    Validate Maintenance Status     ${VAMANDIRI}      ${method}
    ...     ELSE IF     '${method}'=='vabri'        Validate Maintenance Status     ${VABRI}          ${method}
    ...     ELSE IF     '${method}'=='vabni'        Validate Maintenance Status     ${VABNI}          ${method}

Validate Maintenance Status
    [Arguments]     ${methodLoc}        ${method}
    ${maintainFlag}=    run keyword and return status       wait until page contains element        ${methodLoc}/following-sibling::*[@text="Sedang dalam perbaikan"]      timeout=2
    run keyword if      '${maintainFlag}'=='False'          click element       ${methodLoc}
    ...     ELSE        pass execution                      `Transfer with ${method} is not available at the moment`

Validate Minimum Amount Required
    [Arguments]     ${amount}
    run keyword if      ${amount} >= 10000       Run Keywords       Make Payment
    ...     ELSE        Run Keywords        Click Continue Payment
    ...     AND         wait until page contains    Nominal donasi minimal Rp10.000
    ...     AND         log to console      `Donation Amount[${amount}] Less Than Minimum Required`
