*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${settingsBackButton}           xpath=//*[@resource-id="com.kitabisa.android.staging:id/toolbar"]/android.widget.ImageButton[1]
${settingsAnonimOption}         id=com.kitabisa.android.staging:id/switchSetting
${settingsPasswordText}         xpath=//*[@text="Ubah kata sandi"]
${changeAccountTxt}             xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewTitle"])[2]
${confirmationChangeBox}        id=com.kitabisa.android.staging:id/dialog_confirmation_container
${cancelChangeAccount}          id=com.kitabisa.android.staging:id/buttonCancelled

*** Keywords ***
Verify Settings Page
    wait until page contains element    ${settingsAnonimOption}
    page should contain element        ${settingsPasswordText}
    page should contain element        ${changeAccountTxt}

Click Donate as Anonim
    ${anonymStatus}=    get text        ${settingsAnonimOption}

    run keyword if  '${anonymStatus}'=='ON'     repeat keyword      2 times     click element        ${settingsAnonimOption}
    ...     ELSE    click element               ${settingsAnonimOption}
    sleep   1

Click Change Password
    click element                       ${settingsPasswordText}

Click Change Account
    click element                       ${changeAccountTxt}

Cancel Change Account
    wait until page contains element    ${confirmationChangeBox}
    click element                       ${cancelChangeAccount}
