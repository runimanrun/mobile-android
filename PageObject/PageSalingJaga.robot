*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${salaingJagaOnboarding}    Kitabisa Plus kini telah berubah nama menjadi Saling Jaga!
${learnOnboardingButton}    xpath=//*[@text="Yuk, pelajari!"]
${skipOnboardingButton}     id=com.kitabisa.android.staging:id/button_skip
${donasiLagiButton}         xpath=//*[@text="Donasi Lagi"]
${ajukanBantuanButton}      xpath=//*[@text="Ajukan Bantuan"]
${keanggotaanButton}        xpath=//*[@text="Keanggotaan"]
${anggotaTerbaruButton}     xpath=//*[@text="Anggota Terbantu"]
${panduanButton}            xpath=//*[@text="Panduan"]

*** Keywords ***
Verify Saling Jaga Onboarding
    ${result}=      run keyword and return status       wait until page contains        ${salaingJagaOnboarding}      timeout=10
    Run Keyword If  '${result}'=='True'     run keywords        click element           ${learnOnboardingButton}
    ...     AND     click element           ${skipOnboardingButton}

Verify Saling Jaga Screen
    Verify Saling Jaga Onboarding
    wait until page contains element    ${donasiLagiButton}
    page should contain element         ${ajukanBantuanButton}
    page should contain element         ${keanggotaanButton}
    page should contain element         ${anggotaTerbaruButton}
    page should contain element         ${panduanButton}

Go To Donasi Lagi
    wait until element is visible       ${donasiLagiButton}
    click element                       ${donasiLagiButton}

Go To Ajukan Bantuan
    wait until element is visible       ${ajukanBantuanButton}
    click element                       ${ajukanBantuanButton}

Go To Keanggotaan
    wait until element is visible       ${keanggotaanButton}
    click element                       ${keanggotaanButton}

Go To Anggota Terbaru
    wait until element is visible       ${anggotaTerbaruButton}
    click element                       ${anggotaTerbaruButton}

Go To Panduan
    wait until element is visible       ${panduanButton}
    click element                       ${panduanButton}
