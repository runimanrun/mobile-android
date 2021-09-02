*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/otp.robot

*** Variable ***
${usernameInput}                id=com.kitabisa.android.staging:id/editTextUsername
${fullnameInput}                id=com.kitabisa.android.staging:id/editTextFullName
${whatsappCheckbox}             id=com.kitabisa.android.staging:id/checkboxWhatsApp
${regisButton}                  id=com.kitabisa.android.staging:id/buttonRegister
${popupExistAccCancelButton}    id=com.kitabisa.android.staging:id/buttonCancelled
${popupExistAccConfirmButton}   id=com.kitabisa.android.staging:id/buttonConfirmed

*** Keywords ***
Verify Register Page
    wait until page contains            Perjalanan kebaikanmu dimulai di sini
    page should contain element         ${usernameInput}
    page should contain element         ${fullnameInput}

Verify Register Button is Disabled
    element should be disabled          ${regisButton}

Verify Invalid Email or Phone Format
    wait until page contains            Hanya diisi dengan nomor ponsel atau email yang valid

Verify Minimum Char Password
    wait until page contains            Masukkan minimal 8 karakter

Verify Invalid Confirm Password
    wait until page contains            Konfirmasi kata sandi tidak sama

Verify OTP Request Option
    wait until page contains            Kirim OTP melalui
    page should contain element         ${popupExistAccCancelButton}
    page should contain element         ${popupExistAccConfirmButton}

Verify Registered Phone
    [Arguments]     ${existEmail}
    wait until page contains element    ${popupExistAccCancelButton}
    page should contain element         ${popupExistAccCancelButton}
    page should contain element         ${popupExistAccConfirmButton}
    page should contain text            Masuk ke akun dengan nomor ponsel tersebut?
    page should contain text            Nomor ponsel ${existEmail} telah terdaftar

Verify Registered Email
    [Arguments]     ${existPhone}
    wait until page contains element    ${popupExistAccCancelButton}
    page should contain element         ${popupExistAccCancelButton}
    page should contain element         ${popupExistAccConfirmButton}
    page should contain text            Masuk ke akun dengan email tersebut?
    page should contain text            Email ${existPhone} telah terdaftar

Input Email or Phone Number for Register
    [Arguments]     ${emailPhone}
    Clear OTP Counter       stg         ${emailPhone}
    input text                          ${usernameInput}                ${emailPhone}

Input Full Name for Register
    [Arguments]     ${fullName}
    input text                          ${fullnameInput}                ${fullName}

Input Invalid Full Name for Register
    Click Element                       ${fullnameInput}            
    press keycode   9
    Element Should Not Contain Text          ${fullnameInput}       @

Uncheck Whatsapp Binding
    wait until page contains element    ${whatsappCheckbox}
    click element                       ${whatsappCheckbox}

Click on Register Button
    wait until page contains element    ${regisButton}
    click element                       ${regisButton}

Choose OTP by SMS
    click element                       ${popupExistAccConfirmButton}
