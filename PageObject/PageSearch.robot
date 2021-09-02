*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${searchBoxInput}       id=com.kitabisa.android.staging:id/editTextSearch
${backFromSearch}       xpath=//*[@resource-id="com.kitabisa.android.staging:id/toolbar"]/android.widget.ImageButton[1]
${clearSearchButton}    id=com.kitabisa.android.staging:id/buttonClearText
${searchFundSection}    xpath=//*[@text="Galang Dana"]
${orgIndividuSection}   xpath=//*[@text="Organisasi atau Individu"]
${seeAllPenggalangan}   xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonSeeAll"])[1]
${seeAllOrgIndividu}    xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonSeeAll"])[2]
${deleteAllButton}      id=com.kitabisa.android.staging:id/buttonDeleteAll
${keywordViewText}      id=com.kitabisa.android.staging:id/textViewKeyword
${latestSeenCampaign}   xpath=//*[contains(@text,"Terakhir dilihat")]
${recomendCampaign}     xpath=//*[contains(@text,"Rekomendasi untuk kamu")]
${firstResultSearch}    xpath=(//*[@resource-id="com.kitabisa.android.staging:id/cardViewImage"])[1]

*** Keywords ***
Verify Search Screen
    wait until element is visible       ${searchBoxInput}

Verify Search Result
    wait until page contains element    ${searchFundSection}
    page should contain element         ${orgIndividuSection}
    page should contain element         ${seeAllPenggalangan}
    page should contain element         ${seeAllOrgIndividu}

Choose Result Campaign Search
    wait until page contains element    ${firstResultSearch}
    click element                       ${firstResultSearch}

Verify Clear Search Result
    wait until page does not contain element    ${searchFundSection}
    page should not contain element             ${orgIndividuSection}
    page should not contain element             ${seeAllPenggalangan}
    page should not contain element             ${seeAllOrgIndividu}

Verify Last Keyword Search
    ${result}=      run keyword and return status       wait until page contains        ${latestSeenCampaign}      timeout=5
    Run Keyword If  '${result}'=='True'     run keywords        page should contain element     ${deleteAllButton}
    ...     AND     page should contain element     ${keywordViewText}

Input Search Box
    [Arguments]     ${search}
    input text                          ${searchboxinput}       ${search}

Click Back from Search
    wait until page contains element    ${backfromsearch}
    click element                       ${backfromsearch}

Click Clear Search Box
    wait until page contains element    ${clearsearchbutton}
    click element                       ${clearsearchbutton}

Delete Keyword History
    ${result}=      run keyword and return status       wait until page contains        Pencarian terakhir      timeout=5
    Run Keyword If  '${result}'=='True'     run keywords        click element           ${deleteAllButton}
    ...     AND     page should not contain text        Pencarian terakhir
    ...     AND     page should not contain element     ${deleteAllButton}
