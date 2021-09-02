*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${loveListText}                 xpath=//*[@text="Lovelist"]
${loveListGridViewButton}       id=com.kitabisa.android.staging:id/menuGrid
${firstCampaignLoveList}        xpath=//*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]/android.view.ViewGroup[1]
${secondCampaignLoveList}       xpath=//*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]/android.view.ViewGroup[2]
${emptyLovelistTitle}           id=com.kitabisa.android.staging:id/textViewEmptyTitle
${emptyLovelistDescription}     id=com.kitabisa.android.staging:id/textViewEmptyDesc

*** Keywords ***
Verify Love List Page
    wait until page contains element            ${loveListGridViewButton}
    page should contain element                 ${loveListText}
    page should contain element                 ${loveListText}

Verify Empty Love List
    ${result}=      run keyword and return status       wait until page contains element    ${emptyLovelistTitle}       timeout=5
    run keyword if  '${result}'=='True'     run keywords    page should contain element     ${emptyLovelistDescription}
    ...     AND     page should contain text    Belum ada penggalangan favorit
    ...     AND     page should contain text    Semua penggalangan favorit kamu akan disimpan di halaman ini.

Change Layout to Grid View
    click element                               ${loveListGridViewButton}
    sleep   2

Click First Campaign on Favorite List
    wait until page contains element            ${firstCampaignLoveList}
    click element                               ${firstCampaignLoveList}

Click Second Campaign on Favorite List
    wait until page contains element            ${secondCampaignLoveList}
    click element                               ${secondCampaignLoveList}