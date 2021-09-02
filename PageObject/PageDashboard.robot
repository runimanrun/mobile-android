*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${DonasiButton}         id=com.kitabisa.android.staging:id/buttonPrimary
${GalangDanaButton}     id=com.kitabisa.android.staging:id/buttonSecondary

*** Keywords ***
Click on Donasi Button
    wait until page contains element    ${DonasiButton}
    click element                       ${DonasiButton}

Click on Galang Dana Button
    wait until page contains element    ${GalangDanaButton}
    click element                       ${GalangDanaButton}
