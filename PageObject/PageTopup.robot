*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${topupWordingText}             Masukkan nominal saldo
${topupAmountInput}             id=com.kitabisa.android.staging:id/editTextNominal
${topupAmount50}                id=com.kitabisa.android.staging:id/textView50k
${topupAmount100}               id=com.kitabisa.android.staging:id/textView100k
${topupAmount150}               id=com.kitabisa.android.staging:id/textView150k
${topupPaymentMethodButton}     id=com.kitabisa.android.staging:id/textViewChoosePaymentMethod
${topupIsiSaldoButton}          id=com.kitabisa.android.staging:id/buttonTopUp

*** Keywords ***
Verify Topup Saldo Screen
    wait until page contains        ${topupWordingText}
    page should contain element     ${topupAmountInput}
    page should contain element     ${topupAmount50}
    page should contain element     ${topupAmount100}
    page should contain element     ${topupPaymentMethodButton}
    page should contain element     ${topupIsiSaldoButton}

Input Topup Amount
    [Arguments]  ${amount}
    input text                      ${topupAmountInput}         ${amount}

Click Payment Method
    click element                   ${topupPaymentMethodButton}
