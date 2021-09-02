*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${forgotPassLabel}          xpath=//*[@text="Lupa Kata Sandi"]
${phoneEmailInput}          id=com.kitabisa.android.staging:id/editTextEmailOrPhone
${sendButton}               id=com.kitabisa.android.staging:id/buttonSend
${newPassLabel}             xpath=//*[@resource-id="com.kitabisa.android.staging:id/textTitle"]
${newPassInput}             id=com.kitabisa.android.staging:id/editTextNewPassword
${newPassViewToggle}        xpath=(//android.widget.ImageButton[@content-desc="Show password"])[1]
${confirmPassInput}         id=com.kitabisa.android.staging:id/editTextConfirmPassword
${confirmPassViewToggle}    xpath=(//android.widget.ImageButton[@content-desc="Show password"])[2]
${confirmPassError}         id=com.kitabisa.android.staging:id/textinput_error
${saveButton}               id=com.kitabisa.android.staging:id/buttonSave
${updatePassPopupTitle}     id=com.kitabisa.android.staging:id/textViewTitle
${updatePassPopupDesc}      id=com.kitabisa.android.staging:id/textViewDescription
${updatePassPopupButton}    id=com.kitabisa.android.staging:id/buttonClose

*** Keywords ***
Verify Forgot Password Page
    wait until page contains element    ${forgotPassLabel}
    page should contain element         ${phoneEmailInput}

Input Phone or Email
    [Arguments]     ${emailPhone}
    input text                          ${phoneEmailInput}          ${emailPhone}

Click Send Button
    wait until page contains element    ${sendButton}
    click element                       ${sendButton}

Verify Unregistered Phone or Email
    wait until page contains            User tidak ditemukan

Verify Change Password Page
    wait until page contains element    ${newPassLabel}
    page should contain element         ${newPassInput}
    page should contain element         ${confirmPassInput}

Input New Password
    [Arguments]     ${password}
    input text                          ${newPassInput}             ${password}
    press keycode       29
    press keycode       66
    Click Element                       ${newPassViewToggle}

Input Confirm Password
    [Arguments]     ${password}
    input text                          ${confirmPassInput}         ${password}
    press keycode       29
    press keycode       66
    Click Element                       ${confirmPassViewToggle}

Verify Error Confirm Password
    page should contain element         ${confirmPassError}
    page should contain text            Kata sandi baru tidak sesuai

Click Save Button
    click element                       ${saveButton}

Verify Changes Password Popup
    wait until page contains element    ${updatePassPopupTitle}
    page should contain element         ${updatePassPopupDesc}
    page should contain text            Kata Sandi Berhasil Diubah
    page should contain element         ${updatePassPopupButton}
    page should contain text            Silakan login menggunakan Nomor Ponsel atau Email kamu.

Click Masuk Button
    click element                       ${updatePassPopupButton}
