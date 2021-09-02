*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
${descriptionTxt}               id=com.kitabisa.android.staging:id/textViewDescription
${nameOrInfoText}               id=com.kitabisa.android.staging:id/textViewNameOrInfo
${closeBtn}                     id=com.kitabisa.android.staging:id/buttonClose
${nominalTxt}                   id=com.kitabisa.android.staging:id/textViewNominal
${dueDateTxt}                   id=com.kitabisa.android.staging:id/textViewDueDate
${copyBtn}                      id=com.kitabisa.android.staging:id/buttonCopyAccountNumber
${backCampaignBtn}              id=com.kitabisa.android.staging:id/buttonBackToCampaign
${cancelTopupButton}            id=com.kitabisa.android.staging:id/buttonCancelTopup
${cancelTopupConfirmText}       Batalkan isi saldo?
${cancelTopupConfirmButton}     id=com.kitabisa.android.staging:id/buttonConfirmed
${backButtonNavbarTop}          xpath=//*[@resource-id="com.kitabisa.android.staging:id/toolbar"]/android.widget.ImageButton[1]
${seeMemberButton}              id=com.kitabisa.android.staging:id/buttonOk
${popupPage}                    id=com.kitabisa.android.staging:id/constraintLayout

*** Keywords ***

Validate User Get the Summary Pop Up
    wait until page contains element        ${popupPage}

#this action is applicable only for bank tf or va
Validate User Redirected to Summary Page Properly
    wait until page contains element        ${nominalTxt}
    page should contain element             ${dueDateTxt}
    page should contain element             ${nominalTxt}
    page should contain text                Instruksi Pembayaran

Validate Summary Instant Payment
    wait until page contains element        ${nameOrInfoText}
    page should contain text                Donasi saya minggu ini

Validate Account Number Has Been Copied
    wait until page contains                Nomor rekening berhasil disalin

Close the Pop Up
    wait until element is visible           ${closeBtn}
    click element                           ${closeBtn}

Click Copy Account Number
    click element                           ${copyBtn}

Click Back to Campaign
    Scroll Down to Element                  ${backCampaignBtn}      com.kitabisa.android.staging:id/action_bar_root
    click element                           ${backCampaignBtn}

Click Cancel Topup Button
    Scroll Down to Element                  ${cancelTopupButton}    com.kitabisa.android.staging:id/action_bar_root
    wait until page contains element        ${cancelTopupButton}
    click element                           ${cancelTopupButton}

Confirm Cancel Topup
    wait until page contains                ${cancelTopupConfirmText}
    click element                           ${cancelTopupConfirmButton}

Click Back Button on Top Navbar
    wait until page contains element        ${backButtonNavbarTop}
    click element                           ${backButtonNavbarTop}

Click See Member Button
    wait until page contains element        ${seeMemberButton}
    click element                           ${seeMemberButton}
