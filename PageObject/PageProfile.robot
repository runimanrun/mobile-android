*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${profileBackButton}            xpath=//*[@resource-id="com.kitabisa.android.staging:id/toolbar"]/android.widget.ImageButton[1]
${profileCancelButton}          id=com.kitabisa.android.staging:id/menuCancel
${profileEditButton}            id=com.kitabisa.android.staging:id/menuEditProfile
${profileNameText}              id=com.kitabisa.android.staging:id/editTextName
${profileBirthday}              id=com.kitabisa.android.staging:id/editTextBirthday
${profileBioText}               id=com.kitabisa.android.staging:id/editTextBio
${profileSaveButton}            id=com.kitabisa.android.staging:id/buttonSave
${CancelProfilePopupButton}     id=com.kitabisa.android.staging:id/buttonCancelled

*** Keywords ***
Verify Edit Profile Page
    wait until page contains element    ${profileCancelButton}
    element should be enabled           ${profileNameText}
    element should be enabled           ${profileBirthday}
    element should be enabled           ${profileBioText}
    page should contain text            Informasi berikut hanya dapat dilihat oleh kamu dan tidak akan kami publikasikan

Input Profile Name
    [Arguments]     ${profileName}
    input text                          ${profileNameText}          ${profileName}

Input Profile Bio
    [Arguments]     ${profileBio}
    input text                          ${profileBioText}          ${profileBio}

Confirm Cancel Edit Profile
    wait until page contains            Kamu yakin batal ubah profil?
    click element                       ${CancelProfilePopupButton}

Click Edit Profile Button
    wait until page contains element    ${profileEditButton}
    click element                       ${profileEditButton}

Click Cancel Edit Button
    wait until element is visible       ${profileCancelButton}
    click element                       ${profileCancelButton}

Click Save Button
    click element                       ${profileSaveButton}
    sleep   3
    wait until page contains element    ${profileBackButton}
    click element                       ${profileBackButton}
