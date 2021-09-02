*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${chooseCategoryTitle}              id=com.kitabisa.android.staging:id/textViewDescription
${category1}                        xpath=(//*[@resource-id="com.kitabisa.android.staging:id/imageViewCategory"])[1]
${category2}                        xpath=(//*[@resource-id="com.kitabisa.android.staging:id/imageViewCategory"])[2]
${category3}                        xpath=(//*[@resource-id="com.kitabisa.android.staging:id/imageViewCategory"])[3]
${nextButton}                       id=com.kitabisa.android.staging:id/buttonNext
${skipButton}                       id=com.kitabisa.android.staging:id/buttonSkip

*** Keywords ***
Verify Set Campaign Favorit Page
    Wait until page contains element        ${chooseCategoryTitle}       timeout=5
    element should be disabled              ${nextButton}

Set Favourite Category Campaign
    ${status}=      run keyword and return status   Verify Set Campaign Favorit Page
    run keyword if  '${status}'=='True'             run keywords        click element       ${category1}
    ...     AND     click element                   ${category2}
    ...     AND     click element                   ${category3}
    ...     AND     element should be enabled       ${nextButton}
    ...     AND     click element                   ${nextButton}

Skip First Donation
    ${status}=      run keyword and return status   wait until page contains element    ${skipButton}           timeout=5
    run keyword if  '${status}'=='True'     click element                               ${skipButton}
