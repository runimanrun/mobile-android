*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
${donasiSayaTitleText}      Catatan kebaikan
${dateContainerView}        id=com.kitabisa.android.staging:id/currentWeekDateContainer
${donasiSayaSeeAll}         id=com.kitabisa.android.staging:id/textViewSeeAll
${donasiSayaNoteView}       id=com.kitabisa.android.staging:id/kindnessNoteContainer

*** Keywords ***
Verify Donasi Saya Screen
    wait until page contains            ${donasiSayaTitleText}
    page should contain element         ${dateContainerView}
    page should contain element         ${donasiSayaNoteView}
    page should contain element         ${donasiSayaSeeAll}

Verify Catatan Kebaikan Screen
    wait until page contains element    ${donasiSayaNoteView}

See All History Donation
    Long Scrolling Down                 com.kitabisa.android.staging:id/recyclerView    5

Click See All Donation
    click element                       ${donasisayaseeall}
