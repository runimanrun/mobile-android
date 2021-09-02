*** Settings ***
Library     AppiumLibrary       timeout=60
Library     String
Library     BuiltIn
Resource    ../Utils/scrollpage.robot

*** Variable ***
${tabInboxBerita}           xpath=//*[@text="Berita"]
${tabInboxPesan}            xpath=//*[@text="Pesan"]
${imageEmptyUpdate}         xpath=//img[contains(@class, 'style__EmptyUpdateImage')]
${contentListUpdate}        //*[contains(@resource-id, "textViewCampaignTitle")]
${mainPage}                 xpath=//*[contains(@resource-id, "recyclerView")]
${txtCampaignTitle}         //*[contains(@resource-id, "textViewCampaignTitle")]
${firstContenUpdate}        ${mainPage}/android.view.ViewGroup[1]
${updateInfoTitle}          ${firstContenUpdate}//*[contains(@resource-id, "textViewUpdateType")]
${updateCampaignTitle}      ${firstContenUpdate}${txtCampaignTitle}
${updateInfoDateDonation}   ${firstContenUpdate}//*[contains(@resource-id, "textViewLastDonation")]
${updateInfoFundraiser}     ${firstContenUpdate}//*[contains(@resource-id, "textViewFundraiser")]
${updateFirstImage}         ${firstContenUpdate}//*[contains(@class, 'android.widget.ImageView')]
${txtKabarTerbaru}          xpath=//*[@text="Kabar Terbaru"]
${txtRiwayatDonasi}         xpath=//*[@text="Riwayat Donasimu ke Penggalangan Ini"]
${kabarTerbaruSection}      xpath=//*/*[contains (@text, "Kabar Terbaru")]/..
${riwayatDonasiSection}     xpath=//*/*[contains (@text, "Riwayat Donasimu")]/..
${buttonLihatDonasi}        ${riwayatDonasiSection}/android.widget.Button
${buttonLihatKabarTerbaru}  ${kabarTerbaruSection}/android.widget.Button
${lihatSemuaFundraiser}     xpath=//*[contains(@resource-id, "imageViewArrow")]
${txtNoNotifikasi}          xpath=//*[@text="Untuk melihat update dari penggalanan dana, masuk ke akun kamu dulu yuk!"]
${contenHeaderTitle}        xpath=//*[contains(@resource-id, "appBarLayout")]/*[contains(@resource-id, "toolbar")]/android.widget.TextView
${contenCampaignTitle}      xpath=//*[contains(@resource-id, "textViewCampaignTitle")]
${contenUpdateTitle}        xpath=//*[contains(@resource-id, "textViewTitle")]
${contentDonationText}      xpath=//*[contains(@resource-id, "recyclerViewDonationHistory")]/android.view.ViewGroup[1]/android.widget.TextView[1]
${campaignInfoTitle}        xpath=//*[contains(@resource-id, "header")]/android.widget.TextView
${fundraiserCartContent}    xpath=//*[contains(@resource-id, "headerfragmentContainer"]/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[1]/android.view.ViewGroup[1]
${txtAmount}                xpath=//*[contains(@resource-id, "textViewAmount")]
${firstDonationBox}         xpath=//*[@resource-id="com.kitabisa.android.staging:id/fragmentContainer"]/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[1]/android.view.ViewGroup[1]
${detailDonationPage}       xpath=//*[contains(@resource-id, "DonationStatus")]
${txtDetaiAmount}           xpath=//*[contains(@resource-id, "textViewDetailDonation")]
${txtEmptyNotifInbox}       id=com.kitabisa.android.staging:id/textViewEmptyNotifTitle
${btnDonate}                id=com.kitabisa.android.staging:id/buttonDonateNow

*** Keywords ***
Verify Tab Inboxes are Showing
    wait until element is visible       ${tabInboxBerita}           timeout=60s
    wait until element is visible       ${tabInboxPesan}     timeout=60s

Verify Tab Berita is Clickable
    click element                       ${tabInboxBerita}
    element attribute should match      ${tabInboxBerita}          selected                    true

Verify Tab Pesan is Clickable
    click element                       ${tabInboxPesan}
    element attribute should match      ${tabInboxPesan}            selected                    true

Verify Empty Berita
    Page Should Contain Element         ${txtEmptyNotifInbox}
    Element Should Contain Text         ${txtEmptyNotifInbox}    Belum ada update

Verify Empty Pesan
    Page Should Contain Element         ${txtEmptyNotifInbox}
    Element Should Contain Text         ${txtEmptyNotifInbox}    Belum ada pesan untukmu

Verify Button Donate
    Page Should Contain Element         ${btnDonate}
    Click Element                       ${btnDonate}

Verify the First Content of Notification is Showing
    ${haveNotifikasi}                   run keyword and return status         Element Should Be Visible   ${firstContenUpdate}
    run keyword if                      ${haveNotifikasi}                     Element Should Be Visible   ${firstContenUpdate}           timeout=20s
    ...  ELSE                           Log                                   Verify Empty Notification

Verify load more content update is working
    wait until page contains element    xpath=${contentListUpdate}
    ${updateCount}                      get matching xpath count       ${contentListUpdate}
    ${indexcontentListUpdate}               catenate                       SEPARATOR=          xpath=${contentListUpdate}    [${UpdateCount}]
    ${firstPageTitle}                   get text                       ${txtCampaignTitle}

    FOR     ${PAGE}     IN RANGE        5
       Long Scrolling Down              ${mainPage}        1
       ${updateCount}                   Get Matching Xpath Count       ${contentListUpdate}
       ${updateCount}                   Evaluate                       ${updateCount}-1
       ${indexcontentListUpdate}            catenate                       SEPARATOR=          xpath=${contentListUpdate}    [${UpdateCount}]
       ${lastPageTitle}                 get text                       ${txtCampaignTitle}
       ${isSame}                        run keyword and return status  Should Be Equal       ${firstPageTitle}   ${lastPageTitle}
       Exit For Loop If                 ${isSame}
       Set Global Variable              ${firstPageTitle}            ${lastPageTitle}
    END

Verify the First Content Of Update is Showing Properly
    wait until element is visible       ${firstContenUpdate}
    element should be visible           ${updateFirstImage}
    element should be visible           ${updateInfoTitle}
    element should be visible           ${updateCampaignTitle}
    element should be visible           ${updateInfoDateDonation}

get last fundraiser info
    ${lastFundraiser}       get text    ${updateInfoFundraiser}
    set global variable                 ${LastFundraiser}               ${lastFundraiser}

Click First Update
    wait until element is visible       ${firstContenUpdate}
    ${inboxTitleText}       get text    ${updateInfoTitle}
    ${campaignTitleText}    get text    ${updateCampaignTitle}
    ${lastDonationDate}     get text    ${updateInfoDateDonation}
    ${haveFundraiserInfo}   run keyword and return status               Element Should Be Visible       ${updateInfoFundraiser}
    run keyword if                      ${haveFundraiserInfo}           get last fundraiser info
    ...  ELSE                           Log                             this update doesnt have fundraiser
    ${lastDonationDate}                 remove string                   ${lastDonationDate}        Donasi terakhir kamu ke sini
    set global variable                 ${CampaignTitleText}            ${campaignTitleText}
    set global variable                 ${LastDonationDate}             ${lastDonationDate.strip()}
    set global variable                 ${InboxTitleText}               ${inboxTitleText}
    set global variable                 ${LastDonationDate}             ${lastDonationDate.strip()}
    click element                       ${firstContenUpdate}
    wait until element is visible       ${txtKabarTerbaru}

Verify the Detail Update Showing Properly
    wait until page contains element    ${kabarTerbaruSection}
    ${getTextHeaderTitle}   get text    ${contenHeaderTitle}
    should be equal                     ${getTextHeaderTitle}           ${CampaignTitleText}
    ${getTextOverlayTitle}  get text    ${contenCampaignTitle}
    should be equal                     ${getTextOverlayTitle}          ${CampaignTitleText}
    element should be visible           ${txtKabarTerbaru}
    element should be visible           ${kabarTerbaruSection}
    ${getTextTitleUpdate}   get text    ${contenUpdateTitle}
    should be equal                     ${getTextTitleUpdate}           ${InboxTitleText}
    element should be visible           ${buttonLihatKabarTerbaru}
    scroll to button lihat semua donasi
    ${getTextDonationHistory}           get text                        ${contentDonationText}
    should be equal                     ${getTextDonationHistory}       ${LastDonationDate}

scroll to button lihat semua donasi
    FOR     ${PAGE}     IN RANGE        3
       Long Scrolling Down              ${mainPage}        1
       ${isTrue}                        run keyword and return status   Element Should Be Visible       ${buttonLihatDonasi}
       Exit For Loop If                 ${isTrue}
    END

Verify Lihat Semua on Kabar Terbaru is Clickable
    Long Scrolling Down                 ${mainPage}        1
    click element                       ${buttonLihatKabarTerbaru}
    ${getTextHeaderTitle}               get text                        ${contenHeaderTitle}
    should be equal                     ${getTextHeaderTitle}           Kabar Terbaru
    element should be visible           xpath=//*[@text="${inboxTitleText}"]
    go back

Verify Lihat Semua on History Donation is Clickable
    scroll to button lihat semua donasi
    ${getTextDonationAmount}            get text                        ${txtAmount}
    set global variable                 ${TextDonationAmount}           ${getTextDonationAmount}
    ${moreAction}                       run keyword and return status   Element Should Be Visible      ${buttonLihatDonasi}
    run keyword if                      ${moreAction}                   Verify Lihat Semua Donasi is Show Properly
    ...  ELSE                           verify donation on "detail" is clickable
    go back

Verify Lihat Semua Donasi is Show Properly
    click element                       ${buttonLihatDonasi}
    wait until element is visible       ${campaignInfoTitle}
    ${getTextTitleUpdate}               get text                     ${campaignInfoTitle}
    should be equal                     ${getTextTitleUpdate}        ${CampaignTitleText}
    element should be visible           xpath=//*[@text="${LastDonationDate}"]
    verify donation on "list" is clickable

verify donation on "${type}" is clickable
    run keyword if                      '${type}' == 'detail'       Click Element         ${contentDonationText}
    ...  ELSE                           Click Element         ${firstDonationBox}
    wait until element is visible       ${detailDonationPage}
    ${getTextCampaignTitle}             get text              ${contenCampaignTitle}
    run keyword and return status       Should Be Equal                                    ${getTextCampaignTitle}  ${CampaignTitleText}
    ${getTextDetailAmount}              get text              ${txtDetaiAmount}
    should be equal                     ${getTextDetailAmount}  ${TextDonationAmount}
    go back

Verify Fundraiser Section is Clickable
    sleep   2
    ${haveFundraiser}                   run keyword and return status   Element Should Be Visible      ${lihatSemuaFundraiser}
    run keyword if                      ${haveFundraiser}               Verify Fundraiser Section is Show Properly
    ...  ELSE                           Page Should Not Contain Element               ${lihatSemuaFundraiser}
    go back

Verify Fundraiser Section is Show Properly
    click element                       ${lihatSemuaFundraiser}
    wait until page contains element    ${fundraiserCartContent}
    ${getTextHeaderTitle}               get text                        ${contenHeaderTitle}
    should be equal                     ${getTextHeaderTitle}           Donasimu melalui Fundraiser
    element should be visible           xpath=//*[@text="${LastFundraiser}"]
