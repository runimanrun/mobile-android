*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${zakatWordingText}             Siap Bayar Zakat?
${zakatDistributeButton}        id=com.kitabisa.android.staging.Zakat:id/imageViewDistribute
${zakatCalculatorButton}        id=com.kitabisa.android.staging.Zakat:id/imageViewCalculator
${distributePopupOwrding}       Yuk, bayar zakat di sini!
${distributeAmountInput}        id=com.kitabisa.android.staging.Zakat:id/editTextMoney
${distributeOrgNameOption}      id=com.kitabisa.android.staging.Zakat:id/textViewOrganizationName
${distributeAllowContact}       id=com.kitabisa.android.staging.Zakat:id/switchAllowContacted
${distributePaymentMethod}      id=com.kitabisa.android.staging.Zakat:id/textViewChoosePaymentMethod
${distributePayZakatButton}     id=com.kitabisa.android.staging.Zakat:id/buttonPayNow
${dompetDhuafaOption}           xpath=//*[@text="Dompet Dhuafa"]
${rumahZakatOption}             xpath=//*[@text="Rumah Zakat"]
${rumahYatimOption}             xpath=//*[@text="Rumah Yatim"]
${firstSpesificZakat}           xpath=//*[@resource-id="com.kitabisa.android.staging.Zakat:id/recyclerView"]/android.view.ViewGroup[4]/androidx.cardview.widget.CardView[1]

*** Keywords ***
Verify Zakat Screen
    wait until page contains        ${zakatWordingText}
    page should contain element     ${zakatDistributeButton}
    page should contain element     ${zakatCalculatorButton}

Verify Distribute Zakat Popup
    wait until page contains        ${distributePopupOwrding}
    element should be visible       ${distributeAmountInput}
    element should be visible       ${distributeOrgNameOption}
    element should be visible       ${distributePaymentMethod}

Verify Organization Zakat Screen
    wait until element is visible   ${rumahZakatOption}
    element should be visible       ${rumahYatimOption}

Validate Zakat with Minimum Amount Required
    wait until page contains        Nominal donasi minimal Rp10.000

Input Zakat Amount
    [Arguments]     ${amount}
    wait until element is visible   ${distributeAmountInput}
    input text                      ${distributeAmountInput}        ${amount}

Choose Zakat Organization
    [Arguments]     ${organization}
    click element                   ${distributeOrgNameOption}
    Verify Organization Zakat Screen
    click element                   xpath=//*[@text="${organization}"]
    set global variable             ${verifiedOrg}      ${organization}

Click on Allow Contacted
    ${verifiedOrgText}=             catenate            Saya bersedia dihubungi oleh        ${verifiedOrg}
    ${result}=      run keyword and return status       Wait Until Page Contains Element    ${distributeAllowContact}      timeout=3
    Run Keyword If  '${result}'=='True'     run keywords    wait until page contains        ${verifiedOrgText}
    ...     AND     click element                       ${distributeAllowContact}
    ...     ELSE    page should not contain element     ${distributeAllowContact}

Click on Payment Method
    wait until element is visible   ${distributePaymentMethod}
    click element                   ${distributePaymentMethod}

Click on Salurkan Button
    click element                   ${zakatDistributeButton}

Click on Calculator Button
    click element                   ${zakatCalculatorButton}

Click Bayar Zakat Button
    wait until element is visible   ${distributePayZakatButton}
    click element                   ${distributePayZakatButton}

Click First Spesific Zakat
    click element                   ${firstspesificzakat}
