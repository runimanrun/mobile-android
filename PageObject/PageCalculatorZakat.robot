*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${calculatorProfesiButton}      xpath=//*[@text="Profesi"]
${calculatorMaalButton}         xpath=//*[@text="Maal"]
${calculateZakatButton}         id=com.kitabisa.android.staging.Zakat:id/buttonCountZakat
${monthlyIncomeInput}           id=com.kitabisa.android.staging.Zakat:id/editTextIncome
${otherIncomeInput}             id=com.kitabisa.android.staging.Zakat:id/editTextAnotherIncome
${debtInstallmentInput}         id=com.kitabisa.android.staging.Zakat:id/editTextDebtInstallment
${calcZakatProfesiPopupText}    Hasil Perhitungan Zakat Profesi
${nisabNotReachedText}          Zakat kamu belum memenuhi nisab
${nisabReachedText}             Salurkan ke Lembaga Amil Zakat Resmi
${depositAmountInput}           id=com.kitabisa.android.staging.Zakat:id/editTextDepositValue
${propertyAmountInput}          id=com.kitabisa.android.staging.Zakat:id/editTextPropertyValue
${goldSilverAmountInput}        id=com.kitabisa.android.staging.Zakat:id/editTextGoldSilver
${holdingAmountInput}           id=com.kitabisa.android.staging.Zakat:id/editTextHolding
${personalDebtInput}            id=com.kitabisa.android.staging.Zakat:id/editTextPersonalDebt
${calcZakatMaalPopupText}       Hasil Perhitungan Zakat Maal

*** Keywords ***
Verify Calculator Zakat Screen
    wait until page contains element    ${calculatorProfesiButton}
    page should contain element         ${calculatorMaalButton}
    page should contain element         ${calculateZakatButton}

Verify Calculated Zakat Profesi Popup
    wait until page contains            ${calcZakatProfesiPopupText}

Verify Calculated Zakat Maal Popup
    wait until page contains            ${calcZakatMaalPopupText}

Verify Calculated Zakat Nisab Not Reached
    wait until page contains            ${nisabNotReachedText}

Verify Calculated Zakat Nisab Reached Amount Required
    wait until page contains            ${nisabReachedText}

Input Monthly Income
    [Arguments]     ${amount}
    input text                          ${monthlyincomeinput}       ${amount}

Input Other Income
    [Arguments]     ${amount}
    input text                          ${otherIncomeInput}         ${amount}

Input Debt Installment
    [Arguments]     ${amount}
    input text                          ${debtInstallmentInput}     ${amount}

Input Deposito Amount
    [Arguments]     ${amount}
    input text                          ${depositamountinput}       ${amount}

Input Property Amount
    [Arguments]     ${amount}
    input text                          ${propertyAmountInput}      ${amount}

Input Gold Silver Amount
    [Arguments]     ${amount}
    input text                          ${goldSilverAmountInput}    ${amount}

Input Holding Amount
    [Arguments]     ${amount}
    input text                          ${holdingAmountInput}       ${amount}

Input Personal Debt Amount
    [Arguments]     ${amount}
    input text                          ${personalDebtInput}        ${amount}

Click on Zakat Maal Tab
    click element                       ${calculatorMaalButton}

Click Calculate Zakat Button
    wait until element is visible       ${calculatezakatbutton}
    click element                       ${calculatezakatbutton}
