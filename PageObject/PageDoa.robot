*** Settings ***
Library         AppiumLibrary

*** Variables ***
${doaLayout}                    xpath=(//*[@resource-id="com.kitabisa.android.staging:id/mainLayout"])[1]
${donaturName}                  xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewDonaturName"])[1]
${campaignName}                 xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewCampaignName"])[1]
${timeDoa}                      xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewTime"])[1]
${contentDoa}                   xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewDoa"])[1]
${likeDoa}                      xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewLikerSpan"])[1]
${amiinDoaBtn}                  xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonAamiin"])[1]
${doaShareBtn}                  xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonShare"])[1]
${moreDoa}                      xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonShowMore"])[1]
${ellipsisBtn}                  xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonMore"])[1]
${laporkanBtn}                  xpath=//*[contains(@text, "Laporkan")]
${laporanContent}               id=com.kitabisa.android.staging:id/editTextComment
${confirmLaporkanBtn}           id=com.kitabisa.android.staging:id/buttonConfirmed
${semuaDoa}                     xpath=//android.widget.LinearLayout[@content-desc="Semua Doa"]
${doaSaya}                      xpath=//android.widget.LinearLayout[@content-desc="Doa Saya"]
${reportedDoa}                  xpath=(//*[contains(@text,"Kamu melaporkan doa ini")])[1]
${lihatReportedDoa}             xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewSee"])[1]
${sortBtn}                      id=com.kitabisa.android.staging:id/sort
${terpopulerSort}               xpath=//*[contains(@text, "Terpopuler")]
${terbaruSort}                  xpath=//*[contains(@text, "Terbaru")]
${deleteBtn}                    xpath=//*[contains(@text, "Hapus")]
${lihatSemuaDoa}                xpath=//*[@text="Doa-doa #OrangBaik"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/buttonShowMore"]

*** Keywords ***
Verify Doa Layout Show Properly
    wait until page contains element        ${doaLayout}
    Page should contain element             ${ellipsisBtn}
    Page should contain element             ${donaturName}
    Page should contain element             ${campaignName}
    Page should contain element             ${timeDoa}
    Page should contain element             ${contentDoa}
    Page should contain element             ${likeDoa}
    Page should contain element             ${amiinDoaBtn}
    Page should contain element             ${doaShareBtn}

Click Campaign Name
    click element                           ${campaignName}

Lapor or Delete Doa
    click element                           ${ellipsisBtn}
    
Verify Report Option
    ${result}=          run keyword and return status               page should contain text        Laporkan
    run keyword If     '${result}'=='True'        Input Laporan     Lapor Pak!                                                   
    ...       ELSE      Confirm Delete Doa Saya

Input Laporan
    [Arguments]         ${comment}
    click element                           ${laporkanBtn}
    wait until element is visible           ${laporanContent}
    input text                              ${laporanContent}           ${comment}
    click element                           ${confirmLaporkanBtn}

Confirm Delete Doa Saya
    click element                           ${deleteBtn}
    click element                           ${confirmLaporkanBtn}

Verify Amiin Doa
    ${result}=      run keyword and return status           Element should contain text             ${likeDoa}          Kamu dan
    run keyword if          '${result}'=='True'             Un-Amiin Doa
    ...     ELSE                                            Amiin Doa            

Amiin Doa
    click element                           ${amiinDoaBtn}
    Element should contain text             ${likeDoa}          Kamu dan

Un-Amiin Doa
    click element                           ${amiinDoaBtn}
    Element should not contain text         ${likeDoa}          Kamu dan

Verify Share Doa
    Page should contain element            ${doaShareBtn}
    Element should contain text            ${doaShareBtn}       Bagikan

Amiinkan Doa Lainnya
    Page should contain element             ${moreDoa}
    click element                           ${moreDoa}

Verify Lihat Semua Doa
    wait until page contains element        ${semuaDoa}

Click Tab Doa Saya
    wait until page contains element        ${doaSaya}
    click element       ${doaSaya}

Lihat Doa Saya
    ${result}=          run keyword and return status       page should contain element            ${doaLayout}
    run keyword if      '${result}'=='True'                 Page should contain element            ${donaturName}
    ...       ELSE      page should contain text            Belum ada doa

Verify Reported Doa
    ${result}=          run keyword and return status       wait until page contains element        ${reportedDoa}
    run keyword if      '${result}'=='True'                 click element       ${lihatReportedDoa}
    ...       ELSE      page should contain element         ${doaLayout}

Click Sorting Button
    wait until page contains element    ${sortBtn}
    click element                       ${sortBtn}

Verify Sorting Option
    wait until page contains element    ${terpopulerSort}
    wait until page contains element    ${terbaruSort}
    click element                       ${terpopulerSort}
