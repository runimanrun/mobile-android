*** Settings ***
Library         AppiumLibrary
Resource    ../Utils/scrollpage.robot

*** Variables ***
${pageDoaContainer}             id=com.kitabisa.android.staging:id/scrollView
${fullNameReport}               id=com.kitabisa.android.staging:id/editTextFullName
${phoneReport}                  id=com.kitabisa.android.staging:id/editTextPhoneNumber
${emailReport}                  id=com.kitabisa.android.staging:id/editTextEmail
${pelanggaranOptBtn}            id=com.kitabisa.android.staging:id/spinnerCategory
${optInfoPalsu}                 xpath=//*[contains(@resource-id, "android:id/text1") and @text="Memberikan Informasi Palsu"]
${commentReport}                id=com.kitabisa.android.staging:id/editTextReport
${reportSendBtn}                id=com.kitabisa.android.staging:id/buttonSend   

*** Keywords ***
Verify Report Penggalangan Page
    wait until page contains element                    ${fullNameReport}
    wait until page contains element                    ${phoneReport}
    wait until page contains element                    ${emailReport}
    wait until page contains element                    ${commentReport}
    wait until page contains element                    ${reportSendBtn}

Input Name to Report Penggalangan
    [Arguments]                 ${name}
    element should be visible   ${fullNameReport}
    input text                  ${fullNameReport}        ${name}

Input Phone to Report Penggalangan
    [Arguments]                 ${phone}
    element should be visible   ${phoneReport}
    input text                  ${phoneReport}          ${phone}

Input Email to Report Penggalangan
    [Arguments]                 ${email}
    input text                  ${emailReport}          ${email}

Choose Reason to Report Penggalangan
    click element               ${pelanggaranOptBtn}
    click element               ${optInfoPalsu}

Input Detail Report
    [Arguments]                 ${comment}
    element should be visible   ${commentReport}
    input text                  ${commentReport}        ${comment}

Send Report Penggalangan
    long scrolling down         ${pageDoaContainer}     1
    click element               ${reportSendBtn}
