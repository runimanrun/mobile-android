*** Settings ***
Library     AppiumLibrary
Resource    ../Utils/scrollpage.robot

*** Variables ***
${container}                id=com.kitabisa.android.staging:id/contentView
${amountBox}                id=com.kitabisa.android.staging:id/editTextNominal
${dateBox}                  id=com.kitabisa.android.staging:id/textViewDonationDate
${billDate}                 xpath=(//*[@class="android.widget.CheckedTextView"])[14]
${paymentMethod}            id=com.kitabisa.android.staging:id/textViewPaymentMethodSelect
${emailBox}                 id=com.kitabisa.android.staging:id/editTextEmail
${confirmDonasiRutin}       id=com.kitabisa.android.staging:id/buttonConfirmDonation
${activateDonasiRutin}      id=com.kitabisa.android.staging:id/buttonActivate
${donasiRutinDotMenu}       id=com.kitabisa.android.staging:id/imageViewOptions
${donasiRutinStatus}        id=com.kitabisa.android.staging:id/textViewDonationStatus
${changeDonasiRutin}        id=com.kitabisa.android.staging:id/layoutOptionUpdate
${stopDonasiRutin}          id=com.kitabisa.android.staging:id/layoutOptionStop
${stopConfirmBtn}           id=com.kitabisa.android.staging:id/buttonConfirmed
${cancelBtn}                id=com.kitabisa.android.staging:id/buttonCancelled

*** Keywords ***
Input Amount to Donasi Rutin
    [Arguments]         ${amount}
    Wait until page contains element            ${amountBox}
    input text              ${amountBox}        ${amount}

Select Payment Date
    click element           ${dateBox}
    wait until page contains element            ${billDate}
    click element           ${billDate}

Choose Payment Donasi Rutin
    long scrolling down     ${container}        1
    click element           ${paymentMethod}

Verify Donate to Donasi Rutin
    wait until page contains element            ${confirmDonasiRutin}
    click element           ${confirmDonasiRutin}

Activate Donasi Rutin
    wait until page contains element            ${activateDonasiRutin}
    click element           ${activateDonasiRutin}

Verify Activated Campaign on Donasi Rutin
    wait until page contains element            ${donasiRutinDotMenu}
    click element                               ${donasiRutinDotMenu}

Change Donasi Rutin
    wait until page contains element            ${changeDonasiRutin}
    click element                               ${changeDonasiRutin}

Stop Donasi Rutin
    wait until page contains element            ${stopDonasiRutin}
    click element                               ${stopDonasiRutin}

Confirm Stop Donasi Rutin
    wait until page contains element            ${stopConfirmBtn}
    wait until page contains element            ${cancelBtn}
    click element                               ${stopConfirmBtn}
