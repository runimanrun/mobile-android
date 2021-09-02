*** Settings ***
Library     AppiumLibrary       timeout=60
Library     String
Resource    ../Utils/otp.robot

*** Variable ***
${usernameTxt}          id=com.kitabisa.android.staging:id/editTextUsername
${passwordTxt}          id=com.kitabisa.android.staging:id/editTextPassword
${passwordErrorText}    id=com.kitabisa.android.staging:id/textinput_error
${passwordViewButton}   id=com.kitabisa.android.staging:id/text_input_end_icon
${forgotPassButton}     id=com.kitabisa.android.staging:id/buttonForgotPassword
${loginBtn}             id=com.kitabisa.android.staging:id/buttonLogin
${nextBtn}              id=com.kitabisa.android.staging:id/buttonNext
${loginWithEmailOTP}    id=com.kitabisa.android.staging:id/buttonRequestOtp
${loginWithSMSOTP}      id=com.kitabisa.android.staging:id/cardViewSmsOtp
${loginWithWAOTP}       id=com.kitabisa.android.staging:id/cardViewWhatsappOtp
${passwordMethod}       id=com.kitabisa.android.staging:id/cardviewPassword
${otpEmailMethod}       id=com.kitabisa.android.staging:id/cardviewEmail
${otpSmsMethod}         id=com.kitabisa.android.staging:id/cardviewSms
${otpWAMethod}          id=com.kitabisa.android.staging:id/cardviewWhatsapp
${otpInputText1}        id=com.kitabisa.android.staging:id/editTextDigit1
${otpInputText2}        id=com.kitabisa.android.staging:id/editTextDigit2
${otpInputText3}        id=com.kitabisa.android.staging:id/editTextDigit3
${otpInputText4}        id=com.kitabisa.android.staging:id/editTextDigit4
${otpInputText5}        id=com.kitabisa.android.staging:id/editTextDigit5
${otpInputText6}        id=com.kitabisa.android.staging:id/editTextDigit6
${otpVerifyButton}      id=com.kitabisa.android.staging:id/buttonVerify
${registerButton}       id=com.kitabisa.android.staging:id/buttonRegister
${regisCancelButton}    id=com.kitabisa.android.staging:id/buttonCancelled
${regisConfirmButton}   id=com.kitabisa.android.staging:id/buttonConfirmed
${closeSamsungPassBtn}  id=com.samsung.android.samsungpassautofill:id/close_icon
${expiredRequestOtp}    id=com.kitabisa.android:id/textDontHaveCode
${resendRegis}          id=com.kitabisa.android.staging:id/buttonResend
${kirimUlangText}       xpath=//*[contains(@text, "Kirim ulang kode")]
${titleOtpText}         id=com.kitabisa.android.staging:id/textTitle
${lockedText}           id=com.kitabisa.android.staging:id/textLockedMessage
${changeUsernameBtn}    id=com.kitabisa.android.staging:id/buttonChangeUsername

*** Keywords ***
Verify Login Page
    wait until page contains element    ${usernameTxt}
    page should contain element         ${usernameTxt}
    page should contain element         ${nextBtn}

Verify Invalid Password
    wait until page contains            kata sandi atau email/nomor telepon yang kamu masukkan salah

Verify Invalid Password Twice
    wait until page contains            Oops, masih salah. Coba opsi login lain atau lupa kata sandi?

Verify Pemulihan Akun
    wait until page contains element            ${lockedText}

Verify Invalid Phone or Email Format
    wait until page contains            Hanya diisi dengan nomor ponsel atau email yang valid

Verify Lanjutkan Button is Disabled
    wait until page contains element    ${usernameTxt}
    element should be disabled          ${nextBtn}

Verify Unregistered Email
    [Arguments]     ${unregEmail}
    wait until page contains element    ${regisCancelButton}
    page should contain element         ${regisCancelButton}
    page should contain element         ${regisConfirmButton}
    page should contain text            Belum ada akun yang menggunakan email ini.
    page should contain text            Lanjutkan mendaftar dengan ${unregEmail}?

Verify Unregistered Phone
    [Arguments]     ${unregPhone}
    wait until page contains element    ${regisCancelButton}
    page should contain element         ${regisCancelButton}
    page should contain element         ${regisConfirmButton}
    page should contain text            Belum ada akun yang menggunakan nomor ponsel ini.
    page should contain text            Lanjutkan mendaftar dengan ${unregPhone}?

Verify OTP Page
    page should contain element        ${titleOtpText}
    
Verify Resend OTP
    Wait Until Page Does Not Contain Element        ${kirimUlangText}
    Click Element                                   ${resendRegis}                       
    
Verify OTP Key
    [Arguments]     ${environment}      ${channel}      ${type}     ${emailPhone}
    sleep   2
    ${result}=      run keyword and return status       Wait Until Page Contains Element    ${otpInputText1}        timeout=15
    ${otp}=         Get OTP Key     ${environment}      ${channel}      ${type}     ${emailPhone}
    run keyword if  '${result}'=='True'     Input OTP       ${otp}

Verify Invalid OTP
    wait until page contains            Kode verifikasi salah, Silakan coba lagi

Verify 3 Times Invalid OTP
    wait until page contains            Kamu sudah gagal 3 kali, silakan minta kirim ulang kode

Input Username
    [Arguments]     ${username}
    Clear OTP Counter       stg         ${username}
    wait until page contains element    ${usernameTxt}
    input text                          ${usernameTxt}      ${username}

Input User Password
    [Arguments]     ${password}
    wait until page contains element    ${passwordTxt}

    ${result}=      run keyword and return status   wait until element is visible   ${closeSamsungPassBtn}  timeout=2
    run keyword if  '${result}'=='True'             click element                   ${closeSamsungPassBtn}

    input password                      ${passwordTxt}      ${password}
    click element                       ${passwordViewButton}

Choose Login with Email OTP
    wait until page contains element    ${loginWithEmailOTP}
    click element                       ${loginWithEmailOTP}

Choose Login with SMS OTP
    wait until page contains element    ${loginWithSMSOTP}
    click element                       ${loginWithSMSOTP}

Choose Login with Whatsapp OTP
    wait until page contains element    ${loginWithWAOTP}
    click element                       ${loginWithWAOTP}

Choose Password Method
    wait until page contains element    ${passwordMethod}
    click element                       ${passwordMethod}

Choose OTP Email Method
    wait until page contains element    ${otpEmailMethod}
    click element                       ${otpEmailMethod}

Choose OTP Phone Method
    wait until page contains element    ${otpSmsMethod}
    click element                       ${otpSmsMethod}

Choose OTP Whatsapp Method
    wait until page contains element    ${otpWAMethod}
    click element                       ${otpWAMethod}

Input OTP
    [Arguments]     ${otp}

    wait until page contains element    ${otpInputText1}

    ${otp1}=        get substring       ${otp}  0   1
    ${otp2}=        get substring       ${otp}  1   2
    ${otp3}=        get substring       ${otp}  2   3
    ${otp4}=        get substring       ${otp}  3   4
    ${otp5}=        get substring       ${otp}  4   5
    ${otp6}=        get substring       ${otp}  5   6

    input text                          ${otpInputText1}        ${otp1}
    input text                          ${otpInputText2}        ${otp2}
    input text                          ${otpInputText3}        ${otp3}
    input text                          ${otpInputText4}        ${otp4}
    input text                          ${otpInputText5}        ${otp5}
    input text                          ${otpInputText6}        ${otp6}

Click Login Button
    wait until element is visible       ${loginBtn}
    click element                       ${loginbtn}

Click Next Button
    click element                       ${nextBtn}

Click OTP Verify Button
    wait until page contains element    ${otpVerifyButton}
    click element                       ${otpVerifyButton}

Click Register Button
    wait until page contains element    ${registerButton}
    click element                       ${registerButton}

Click Cancel Popup Regis Button
    click element                       ${regisCancelButton}

Click Forgot Password
    wait until page contains element    ${forgotPassButton}
    click element                       ${forgotPassButton}

Click Change Username
    wait until element is visible       ${passwordTxt}      timeout=10
    click element                       ${usernameTxt}
    click element                       ${changeUsernameBtn}
    clear text                          ${usernameTxt}   

Verify Username Changed
    [Arguments]         ${email}
    input text                          ${usernameTxt}      ${email}
    ${getUsername}          get text    ${usernameTxt}
    element should contain text         ${usernameTxt}          ${getUsername}   