*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
${keanggotaanOnboarding}    Klik kartu keanggotaan untuk melihat detail anggota.
${closeOnboardingAnggota}   id=com.kitabisa.android.staging:id/button_done
${profileKeanggotaanView}   id=com.kitabisa.android.staging:id/profileView
${profileNameLabel}         id=com.kitabisa.android.staging:id/textViewName
${helpedLabel}              id=com.kitabisa.android.staging:id/textViewHelpedLabel
${donatedLabel}             id=com.kitabisa.android.staging:id/textViewDonatedLabel
${addMemberButton}          id=com.kitabisa.android.staging:id/fab
${addFamilyContainer}       id=com.kitabisa.android.staging:id/addFamilyContent
${choosePoolButton}         id=com.kitabisa.android.staging:id/buttonChoosePool
${chooseOptionParent}       xpath=//*[@text="Saling Jaga Orang Tua"]
${chooseOptionPaers}        xpath=//*[@text="Saling Jaga Sesama"]
${chooseRelationButton}     id=com.kitabisa.android.staging:id/buttonChooseRelation
${chooseBirthdateButton}    id=com.kitabisa.android.staging:id/editTextBirthdayDate
${selectBirthdateButton}    id=com.kitabisa.android.staging:id/buttonChoose
${relationOption}           id=com.kitabisa.android.staging:id/spinnerFamilyRelationship
${relationStatusInput}      id=com.kitabisa.android.staging:id/editTextRelation
${relationNameInput}        id=com.kitabisa.android.staging:id/editTextFullName
${relationPhoneWaInput}     id=com.kitabisa.android.staging:id/editTextWaOrEmail
${relationCheck}            id=com.kitabisa.android.staging:id/checkbox
${addRelationConfirm}       id=com.kitabisa.android.staging:id/buttonConfirmed
${seeMembersButton}         id=com.kitabisa.android.staging:id/buttonSee
${tabFilterView}            id=com.kitabisa.android.staging:id/recyclerViewFilter
${filterLainnyaTab}         xpath=//*[@text="Lainnya"]
${familyCardView}           id=com.kitabisa.android.staging:id/recyclerViewCard
${lastFamilyCard}           xpath=(//android.widget.ImageView[@content-desc="Kitabisa-staging"])[4]
${verifikasiButton}         xpath=//*[@text="Verifikasi"]
${redonateButton}           xpath=//*[@text="Donasi lagi"]
${verifyPageText}           Verifikasi Keanggotaan Keluargamu
${fullnameInput}            id=com.kitabisa.android.staging:id/editTextFullName
${ktpInput}                 id=com.kitabisa.android.staging:id/editTextKtp
${lanjutButton}             xpath=//*[@text="Lanjut"]
${textInputError}           id=com.kitabisa.android.staging:id/textinput_error
${ktpLengthErrorText}       Nomor KTP (NIK) minimal 16 angka
${verificationTNCText}      Baca Dulu Syarat Keanggotaannya, Ya!
${verificationTNCAge}       Berusia 17-59 tahun saat mengajukan bantuan
${verificationTNCCountry}   WNI dan berdomisili di Indonesia
${verificationTNCIllness}   Tidak memiliki penyakit kritis sebelum bergabung
${verificationAggreeCheck}  id=com.kitabisa.android.staging:id/checkbox
${verificationNowButton}    id=com.kitabisa.android.staging:id/buttonAbout

*** Keywords ***
Verify Keanggotaan Onboarding
    ${result}=      run keyword and return status       wait until page contains        ${keanggotaanOnboarding}      timeout=7
    Run Keyword If  '${result}'=='True'                 click element                   ${closeOnboardingAnggota}

Verify Keanggotaan Screen
    Verify Keanggotaan Onboarding
    wait until page contains element    ${tabFilterView}
    page should contain element         ${profileNameLabel}
    page should contain element         ${helpedLabel}
    page should contain element         ${donatedLabel}

Verify Add Member Screen
    # wait until page contains element    ${addFamilyContainer}
    # page should contain element         ${choosePoolButton}
    wait until page contains element    ${relationOption}
    page should contain element         ${relationNameInput}
    page should contain element         ${relationPhoneWaInput}

Verify Verification Keanggotaan Screen
    wait until page contains            ${verifyPageText}
    page should contain element         ${fullnameInput}
    page should contain element         ${ktpInput}
    page should contain element         ${lanjutButton}

Verify KTP Length Error
    wait until element is visible       ${textInputError}
    page should contain text            ${ktpLengthErrorText}

Verify Verification TnC Screen
    wait until page contains            ${verificationTNCText}
    page should contain text            ${verificationTNCAge}
    page should contain text            ${verificationTNCCountry}
    page should contain text            ${verificationTNCIllness}

Select Program
    [Arguments]     ${program}
    wait until element is visible       ${choosePoolButton}
    click element                       ${choosePoolButton}
    wait until page contains element    xpath=//*[@text="${program}"]
    click element                       xpath=//*[@text="${program}"]

Select Relation Status
    [Arguments]     ${relation}
    wait until element is visible       ${relationOption}
    click element                       ${relationOption}
    wait until page contains element    xpath=//*[@text="${relation}"]
    click element                       xpath=//*[@text="${relation}"]

Input Relation Name
    ${name}=        generate random string      15      [LETTERS]
    input text                          ${relationNameInput}            ${name}

Input Relation Birthdate
    click element                       ${chooseBirthdateButton}
    wait until element is visible       ${selectBirthdateButton}
    click element                       ${selectBirthdateButton}

Input Relation Phone
    [Arguments]     ${phone}
    input text                          ${relationPhoneWaInput}         ${phone}

Input Full Name
    ${name}=        generate random string      15      [LETTERS]
    input text                          ${fullnameinput}                ${name}

Input KTP Number
    [Arguments]     ${ktp}
    ${random}=     run keyword if      '${ktp}'=='${EMPTY}'             generate random string      16      [NUMBERS]
    ...     ELSE    set variable        ${ktp}
    input text                          ${ktpInput}                     ${random}

Click Add Member Button
    wait until element is visible       ${addMemberButton}
    click element                       ${addMemberButton}

Click Confirm Add Member Button
    wait until element is visible       ${addRelationConfirm}
    click element                       ${addRelationConfirm}

Click Lainnya Tab
    Swipe Right                         ${tabFilterView}                2
    wait until element is visible       ${filterLainnyaTab}
    click element                       ${filterLainnyaTab}

Click Verify Last Family Card
    long scrolling down                 ${familyCardView}               3
    click element                       ${verifikasiButton}

Click Donasi Lagi Last Family Card
    scroll down to element              ${redonateButton}               ${familyCardView}
    wait until element is visible       ${redonateButton}
    click element                       ${redonateButton}

Click Lanjut Button
    wait until element is visible       ${lanjutButton}
    click element                       ${lanjutButton}

Click Agreement Checklist
    # scroll down to element              ${verificationaggreecheck}      ${addfamilycontainer}
    click element                       ${verificationaggreecheck}

Click Verification Now Button
    wait until element is visible       ${verificationnowbutton}
    click element                       ${verificationnowbutton}
