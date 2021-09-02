*** Settings ***
Library     AppiumLibrary       timeout=60
Library     String
Resource    ../Utils/scrollpage.robot

*** Variable ***
${homepagecontainer}            id=com.kitabisa.android.staging:id/pullToRefresh
${homepageWallet}               id=com.kitabisa.android.staging:id/layoutWallet
${campaignListSection}          xpath=//*[@text="Program Spesial Kitabisa"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]/*[@class="androidx.cardview.widget.CardView"][1]
${firstGalangMendesak}          xpath=//*[@text="Penggalangan Dana Mendesak"]/following-sibling::androidx.recyclerview.widget.RecyclerView[1]/androidx.cardview.widget.CardView[1]
${galangDanaMendesakView}       xpath=//*[@text="Penggalangan Dana Mendesak"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]
${donasiPalingCocokSection}     xpath=//*[@text="Donasi Paling Cocok untuk Kamu"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]
${campaignPilihanSection}       xpath=//*[@text="Pilihan Kitabisa"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]
${wajibZakatSection}            xpath=//*[@text="Yuk, tunaikan zakat penghasilanmu"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]
${firstPalingCocokView}         xpath=//*[@text="Donasi Paling Cocok untuk Kamu"]/following-sibling::androidx.recyclerview.widget.RecyclerView[1]/androidx.cardview.widget.CardView[1]
${favoritSection}               xpath=//*[@text="Pilih Kategori Favoritmu"]/following-sibling::androidx.viewpager.widget.ViewPager/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
${firstFavoritCampaign}         xpath=//*[@text="Pilih Kategori Favoritmu"]/following-sibling::androidx.recyclerview.widget.RecyclerView[2]/android.view.ViewGroup[1]
${firstPilihanCampaign}         xpath=//*[@text="Pilihan Kitabisa"]/following-sibling::androidx.recyclerview.widget.RecyclerView/androidx.cardview.widget.CardView[1]/android.view.ViewGroup
${viewAllCategoryFavorit}       xpath=//*[@text="Pilih Kategori Favoritmu"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/buttonSeeMore"]
${giveRecomendationBtn}         id=com.kitabisa.android.staging:id/buttonEllipsize
${giveRecomendationTxt}         id=com.kitabisa.android.staging:id/textViewTitle
${emoticonSadBtn}               id=com.kitabisa.android.staging:id/radioButtonSad
${emoticonNormalBtn}            id=com.kitabisa.android.staging:id/radioButtonMeh
${emoticonHappyBtn}             id=com.kitabisa.android.staging:id/radioButtonSmile
${recomendationComment}         id=com.kitabisa.android.staging:id/editTextComment
${kirimRecomendationBtn}        id=com.kitabisa.android.staging:id/buttonSend
${categoryPilihanView}          id=com.kitabisa.android.staging:id/recyclerViewCategory
${categoriFavoritLainnyaBtn}    xpath=//*[@text="Lainnya"]
${campaignListFavorit}          xpath=//*[@text="Pilih Kategori Favoritmu"]/following-sibling::*[contains(@resource-id, "recyclerViewCampaigns")]
${campaignerKategoriFavorit}    id=com.kitabisa.android.staging:id/textViewCampaigner
${progressKategoriFavorit}      id=com.kitabisa.android.staging:id/progress
${totDonasiKategoriFavorit}     id=com.kitabisa.android.staging:id/textViewReceivedDonation
${permissionPopUp}              xpath=//*[contains(@resource-id,"permission_allow")]
${searchTextBox}                id=com.kitabisa.android.staging:id/buttonSearch
${closeTutorial}                xpath=//*[@text="Mulai sekarang!"]
${skipOnboaringButton}          id=com.kitabisa.android.staging:id/button_skip
${tutorialStartButton}          id=com.kitabisa.android.staging:id/buttonStart
${bantuanPendidikan}            xpath=//*[@text="Bantuan Pendidikan"]
${categoryBalita}               xpath=//*[@text="Balita & Anak Sakit"]
${categoryMedis}                xpath=//*[@text="Bantuan Medis & Kesehatan"]
${categoryNextButton}           id=com.kitabisa.android.staging:id/buttonNext
${reminderWhitch}               id=com.kitabisa.android.staging:id/switchReminder
${nextReminderButton}           id=com.kitabisa.android.staging:id/buttonSaveReminder
${setZakatNoOption}             id=com.kitabisa.android.staging:id/radioButtonZakatNo
${nextSaveZakatButton}          id=com.kitabisa.android.staging:id/buttonSaveZakat
${mengertiButton}               xpath=//*[@text="Oke"]
${navAccount}                   id=com.kitabisa.android.staging:id/menuAccount
${navInbox}                     id=com.kitabisa.android.staging:id/menuInbox
${navMyDonation}                id=com.kitabisa.android.staging:id/menuMyDonation
${navPlus}                      id=com.kitabisa.android.staging:id/menuPlus
${navDonasi}                    id=com.kitabisa.android.staging:id/menuHome
${loveListButton}               id=com.kitabisa.android.staging:id/buttonLovelist
${topupSaldoButton}             id=com.kitabisa.android.staging:id/buttonTopUp
${walletIcon}                   id=com.kitabisa.android.staging:id/imageViewWallet
${walletBalance}                id=com.kitabisa.android.staging:id/textViewWalletAmount
${topupBalance}                 id=com.kitabisa.android.staging:id/buttonTopUp
${pilihanlihatLainnyaBtn}       id=com.kitabisa.android.staging:id/textViewSectionSeeAll
${pilihanLihatSemuaBtn}         ${campaignPilihanSection}/android.view.ViewGroup
${firstListPilihanLainnya}      xpath = (//*[@resource-id="com.kitabisa.android.staging:id/imageView"])[1]
${zakatIconButton}              xpath=//*[@text="Zakat"]
${dotBannerSection}             xpath=//*[@resource-id="com.kitabisa.android.staging:id/dotsIndicator"]
${firstDotBanner}               xpath=(//*[@resource-id="com.kitabisa.android.staging:id/dot"])[1]
${imageBanner}                  xpath=//*[@class="android.widget.FrameLayout"]/*[@class="android.view.ViewGroup"]/*[@class="androidx.cardview.widget.CardView"]/*[@class="android.view.ViewGroup"]/*[@resource-id="com.kitabisa.android.staging:id/imageView"]
${backNavbar}                   xpath=//*[@resource-id="com.kitabisa.android.staging:id/toolbar"]/android.widget.ImageButton[1]
${donasiTile}                   xpath=//*[@resource-id="com.kitabisa.android.staging:id/imageView"]/following::*[@text="Donasi"]
${salingJagaTile}               xpath=//*[@resource-id="com.kitabisa.android.staging:id/imageView"]/following::*[@text="Saling Jaga"]
${galangDanaTile}               xpath=//*[@resource-id="com.kitabisa.android.staging:id/imageView"]/following::*[@text="Galang Dana"]
${donasiTab}                    xpath=//android.widget.LinearLayout[@content-desc="Donasi Sekali"]
${donasiRutinTab}               xpath=//*[contains(@text,"Donasi Rutin")]
# ${txtTunaikanZakat}             xpath=//*[@text="Yuk, tunaikan zakat penghasilanmu"]
${txtWajibZakat}                id=com.kitabisa.android.staging:id/textViewTitle
${amountWajibZakat}             id=com.kitabisa.android.staging:id/textViewZakat
${hitungUlangZakat}             id=com.kitabisa.android.staging:id/textViewRecalculate
${payZakat}                     id=com.kitabisa.android.staging:id/buttonPayZakat
${quranWords}                   id=com.kitabisa.android.staging:id/textViewAyat
${hitungZakatPenghasilan}       id=com.kitabisa.android.staging:id/textViewTitle
${periodeBox}                   id=com.kitabisa.android.staging:id/spinner
${monthPeriod}                  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[1]
${yearPeriod}                   xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[2]
${incomeAmountBox}              id=com.kitabisa.android.staging:id/editTextIncome
${otherIncomeBox}               id=com.kitabisa.android.staging:id/editTextAnotherIncome
${debtBox}                      id=com.kitabisa.android.staging:id/editTextDebtInstallment
${nishabTxt}                    id=com.kitabisa.android.staging:id/textViewNishabLabel
${saveBtn}                      id=com.kitabisa.android.staging:id/buttonSaveZakat
${zakatAmount}                  id=com.kitabisa.android.staging.Zakat:id/textViewMoney
${closeZakatSection}            id=com.kitabisa.android.staging:id/buttonDismiss
${sudahbayar}                   xpath=//*[@text="Saya sudah membayar zakat di tempat lain"]
${skipPeriod}                   xpath=//*[@text="Saya tidak berzakat di periode ini"]
${salingJagaTitleSection}       id=com.kitabisa.android.staging:id/recyclerViewKbp
${salingJagaCard}               id=com.kitabisa.android.staging:id/imageBackground
${lanjutButtonOnboarding}       xpath=//*[@text="Lanjut"]
${startDonationOnboarding}      xpath=//*[contains(@text, "Mulai donasi")]
${donasiRutinHeader}            id=com.kitabisa.android.staging:id/viewRegularDonationIHeader
${donasiRutinTitle}             id=com.kitabisa.android.staging:id/textRegularDonationTitle
${donasiRutinDesc}              id=com.kitabisa.android.staging:id/textRegularDonationDesc
${donasiRutinList}              id=com.kitabisa.android.staging:id/contentView
${donasiRutinfirstList}         xpath= (//*[@resource-id="com.kitabisa.android.staging:id/constraintMain"])[1]
${doaSection}                   xpath=//*[@text="Doa-doa #OrangBaik"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]
${doaDonorsName}                xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewDonaturName"])[1]
${lihatSemuaDoaBtn}             id=com.kitabisa.android.staging:id/imageViewArrow
${doaContent}                   xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewDoa"])[1]
${totalLikeDoa}                 xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewLikerSpan"])[1]
${amiinBtn}                     xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonAamiin"])[1]
${shareDoaBtn}                  xpath=(//*[@resource-id="com.kitabisa.android.staging:id/buttonShare"])[1]


*** Keywords ***
Verify Home Page
    ${result}=      run keyword and return status       wait until element is visible   ${mengertiButton}   timeout=7
    run keyword if  '${result}'=='True'                 click element                   ${mengertiButton}

    wait until page contains element    ${homepageWallet}
    page should contain element         ${navAccount}
    page should contain element         ${navInbox}
    page should contain element         ${navMyDonation}
    page should contain element         ${navPlus}
    page should contain element         ${navDonasi}

Verify Tiles Menu
    wait until page contains element    ${donasiTile}
    wait until page contains element    ${zakatIconButton}
    Wait Until Page Contains Element    ${galangDanaTile}
    Wait Until Page Contains Element    ${salingJagaTile}

Verify Donation Tile
    wait until page contains element    ${donasiTile}
    Page Should Contain Element         ${donasiTile}
    click element                       ${donasiTile}
    Wait Until Page Contains Element    ${donasiTab}
    Page Should Contain Element         ${donasiTab}
    Page Should Contain Element         ${donasiRutinTab}

Verify Donation Rutin Tab
    click element                       ${donasiRutinTab}

Verify Donasi Rutin Page
    wait until page contains element         ${donasiRutinHeader} 
    page should contain element         ${donasiRutinTitle}
    page should contain element         ${donasiRutinDesc}
    page should contain element         ${donasiRutinList}

Choose Donasi Rutin Campaign
    click element                       ${donasiRutinList}

Verify Saling Jaga Tile
    Wait Until Page Contains Element    ${salingJagaTile}
    Click Element                       ${salingJagaTile}

Verify Galang Dana Tile
    Wait Until Page Contains Element    ${galangDanaTile}
    Click Element                       ${galangDanaTile}

Verify Wajib Zakat Section
    Scroll Down to Element              ${payZakat}         ${homepagecontainer}
    page should contain text            Kewajiban zakat kamu
    Page Should Contain Element         ${amountWajibZakat}
    Page Should Contain Element         ${hitungUlangZakat}

Click Bayar Zakat from Home Page
    click element                       ${payZakat}

Verify Ayat Quran
    Swipe Right                         ${quranWords}        1
    Page Should Contain Element         ${quranWords}
    Swipe Left                          ${quranWords}        1

Hitung Ulang Zakat penghasilan
    Click Element                       ${hitungUlangZakat}
    wait until page contains            Pengaturan zakat penghasilan

Change Income        
    [Arguments]                         ${income}    ${otherIncome}    ${debt}
    Click Element                       ${periodeBox}
    wait until element is visible       ${monthPeriod}
    Click Element                       ${monthPeriod}
    Input Text                          ${incomeAmountBox}    ${income}
    Input Text                          ${otherIncomeBox}     ${otherIncome}
    Input Text                          ${debtBox}            ${debt}
    Wait Until Page Contains Element    ${nishabTxt}
    Element Should Be Enabled           ${saveBtn}
    click element                       ${saveBtn}

Zakat Amount Result
    wait until element is visible       ${zakatAmount}

Close Zakat Section
    Page Should Contain Element         ${closeZakatSection}
    Click Element                       ${closeZakatSection}
    
Choose Reason Close Zakat
    wait until page contains element    ${sudahbayar}
    Page Should Contain Element         ${skipPeriod}
    Click Element                       ${sudahbayar}

Saling Jaga Section
    Scroll Down to Element              ${salingJagaTitleSection}    ${homepagecontainer}
    Page Should Contain Element         ${salingJagaCard}    

Donasi Paling Cocok Section
    Scroll Down to Element              ${donasiPalingCocokSection}    ${homepagecontainer}
    Swipe Right                         ${firstPalingCocokView}         1
    Element Should Be Enabled           ${giveRecomendationBtn}

First Donasi Paling Cocok View
    Scroll Down to Element              ${donasiPalingCocokSection}    ${homepagecontainer}
    click element                       ${firstPalingCocokView}
     
Give Recomendation Rate
    [Arguments]        ${comment}
    click element                       ${giveRecomendationBtn}
    wait until element is visible       ${giveRecomendationTxt}
    click element                       ${giveRecomendationTxt}
    wait until element is visible       ${emoticonHappyBtn}
    click element                       ${emoticonHappyBtn}
    input text                          ${recomendationComment}    ${comment}
    click element                       ${kirimRecomendationBtn}
    
Verify Wallet Topup Pending Status
    element should contain text         ${topupSaldoButton}             Pending

Verify Campaign List Kategori Favorit
    wait until page contains element    ${campaignListFavorit}
    
Verify Campaign from Kategori Favorit Section
    page should contain element         ${firstFavoritCampaign}
    click element                       ${firstFavoritCampaign}

Verify Kategori Favorit Section
    Scroll Down to Element              ${viewAllCategoryFavorit}       ${homepagecontainer}
    element should be visible           ${campaignerkategoriFavorit}
    element should be visible           ${progressKategoriFavorit}
    element should be visible           ${totDonasiKategoriFavorit}

Verify Lihat Semua Campaign Favorit
    page should contain element         ${viewAllCategoryFavorit}
    click element                       ${viewAllCategoryFavorit}

Verify Pilihan Kitabisa Section
    scroll down to element              ${campaignPilihanSection}         ${homepagecontainer}
    element should be visible           ${campaignPilihanSection}
    element should be visible           ${pilihanlihatLainnyaBtn}

Choose Campaign from Pilihan Kitabisa
    Verify Pilihan Kitabisa Section
    click element                       ${firstPilihanCampaign}

View All Pilihan Kitabisa
    Verify Pilihan Kitabisa Section
    ${status}=      run keyword and return status       wait until element is visible       ${pilihanLihatSemuaBtn}      timeout=5s
    run keyword if  '${status}'=='False'    Full Swipe Left         ${campaignPilihanSection}       5
    Log to console          ${status}
    click element                           ${pilihanLihatSemuaBtn}

Choose Campaign From Lihat Semua Pilihan Kitabisa
    wait until page contains element    ${firstListPilihanLainnya}      timeout=10
    click element                       ${firstListPilihanLainnya}

Go To Home
    wait until page contains element    ${navDonasi}
    click element                       ${navDonasi}
    page should contain element         ${walletIcon}

Go To My Donation
    wait until page contains element    ${navMyDonation}
    click element                       ${navMyDonation}

Go To Saling Jaga
    wait until page contains element    ${navPlus}
    click element                       ${navPlus}

Go To Inbox
    wait until page contains element    ${navInbox}
    click element                       ${navInbox}

Go To Account
    wait until page contains element    ${navAccount}
    click element                       ${navAccount}

Go To Zakat
    wait until page contains element    ${zakatIconButton}
    click element                       ${zakatIconButton}

Close User Guide Journey
    wait until page contains element    ${searchTextBox}
    click element                       ${searchTextBox}

Close Tutorial
    ${result}=      run keyword and return status       Wait Until Page Contains Element    ${closeTutorial}       timeout=10
    run keyword if  '${result}'=='True'                 Click Element                       ${closeTutorial}

Switch Donation Reminder to Off        
    wait until page contains element    ${reminderWhitch}
    click element                       ${reminderWhitch}
    click element                       ${nextReminderButton}

Choose No Zakat Option
    wait until page contains element    ${setZakatNoOption}
    click element                       ${setZakatNoOption}
    click element                       ${nextSaveZakatButton}

Scroll To Galang Dana Mendesak
    Scroll Down to Element              ${galangdanamendesakview}       ${homepagecontainer}

Scroll To Kategori Favorit
    Scroll Down to Element              ${categoriFavoritLainnyaBtn}    ${homepagecontainer}

Verify Banner Section
    Scroll Down to Element              ${dotBannerSection}    ${homepagecontainer}
    click element                       ${firstDotBanner}

Click Banner Image
    click element                       ${firstDotBanner}
    click element                       ${imageBanner}

Click Back on Navbar
    wait until page contains element    ${backNavbar}
    click element                       ${backNavbar}

Swipe on Banner Image
    Swipe Right                         ${imageBanner}    9

Swipe on Galang Dana Mendesak
    Swipe Right                         ${galangDanaMendesakView}      3
    Swipe Left                          ${galangDanaMendesakView}      3

Click Allow on Permission Pop Up
    ${result}=      run keyword and return status       Wait Until Page Contains Element    ${permissionPopUp}      timeout=5
    Run Keyword If  '${result}'=='True'                 Click Element                       ${permissionPopUp}

Click Tutorial Start Button
    ${result}=      run keyword and return status       Wait Until Page Contains Element    ${tutorialStartButton}      timeout=3
    run keyword if  '${result}'=='True'                 Run Keywords        Click Element   ${tutorialStartButton}
    ...     AND     Click Bantuan Pendidikan
    ...     AND     Click Balita Category
    ...     AND     Click Medis Category
    ...     AND     PageHome.Click Lanjut Button
    ...     AND     Switch Donation Reminder to Off
    ...     AND     Choose No Zakat Option

Click Bantuan Pendidikan
    wait until page contains element    ${bantuanPendidikan}
    click element                       ${bantuanPendidikan}

Click Balita Category
    wait until page contains element    ${categoryBalita}
    click element                       ${categoryBalita}

Click Medis Category
    wait until page contains element    ${categoryMedis}
    click element                       ${categoryMedis}

Click Lanjut Button
    wait until page contains element    ${categoryNextButton}
    click element                       ${categoryNextButton}

Click See All Kategori Pilihan
    Scroll Down to Element              ${viewAllCategoryPilihan}       ${homepagecontainer}
    click element                       ${viewAllCategoryPilihan}

Click First Campaign
    Verify Home Page
    Scroll Down to Element              ${campaignListSection}            ${homepagecontainer}
    wait until page contains element    ${campaignListSection}
    click element                       ${campaignListSection}

Click First Galang Dana Mendesak
    wait until page contains element    ${firstGalangMendesak}
    click element                       ${firstGalangMendesak}

Click Love List Button
    wait until page contains element    ${loveListButton}
    click element                       ${loveListButton}

Click Topup Saldo Button
    wait until page contains element    ${topupSaldoButton}
    click element                       ${topupSaldoButton}

Verify Topup Wallet
    wait until page contains Element    ${topupBalance}
    click element                       ${topupBalance}

Click Search Bar
    wait until element is visible       ${searchTextBox}
    click element                       ${searchTextBox}

Verify Wallet Section
    wait until page contains element    ${homepageWallet}

Click Wallet on Account
    click element                       ${walletIcon}

Get Wallet Balance
    ${balance}          get text        ${walletBalance}
    ${amountBalance}=     Remove String       ${balance}        Rp
    set global variable     ${walletamount}     ${amountBalance.strip()}

Click Favorit Kategori Lainnya
    click element                       ${categoriFavoritLainnyaBtn}

Click Donasi Tile
    click element                       ${donasiTile}

Verify Doa Section
    Scroll Down to Element                 ${doaSection}            ${homepagecontainer}
    page should contain element            ${pilihanlihatLainnyaBtn}
    page should contain element            ${doaDonorsName}
    page should contain element            ${doaContent}
    page should contain element            ${totalLikeDoa}
    page should contain element            ${amiinBtn}
    page should contain element            ${shareDoaBtn}

Verify Lihat Doa Lainnya
    click element                           ${pilihanlihatLainnyaBtn}

Choose First Doa
    click element                           ${doaDonorsName}

Verify Semua Doa
    ${status}=      run keyword and return status       wait until element is visible       ${lihatSemuaDoaBtn}      timeout=5s
    run keyword if  '${status}'=='False'    Full Swipe Left         ${doaSection}       5
    Log to console          ${status}
    click element                           ${lihatSemuaDoaBtn}
