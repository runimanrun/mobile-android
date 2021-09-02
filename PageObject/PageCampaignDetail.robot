*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
${backIcon}                 xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
${shareTopBtn}              id=com.kitabisa.android.staging:id/menuShare
${optionTopBtn}             xpath=//android.widget.ImageView[@content-desc="More options"]
${contentContainer}         id=com.kitabisa.android.staging:id/coordinatorLayout
${imageCampaign}            id=com.kitabisa.android.staging:id/imageView
${campaignTitleTxt}         id=com.kitabisa.android.staging:id/textViewTitle
${loveButton}               id=com.kitabisa.android.staging:id/buttonLovelist
${donasiBtn}                id=com.kitabisa.android.staging:id/buttonDonate
${galangDanaSection}        id=com.kitabisa.android.staging:id/campaignerLayout
${penggalangLabel}          id=com.kitabisa.android.staging:id/textViewLabelTitle
${campaignerName}           id=com.kitabisa.android.staging:id/textViewCampaignerName
${headerPenggalangPage}     xpath=//*[contains(@class,"android.widget.TextView") and @text="Info Penggalang"]
${aboutPenggalangPage}      xpath=//*[@resource-id="com.kitabisa.android.staging:id/textViewAboutTitle"]
${listPenggalangPage}       xpath=//*[contains(@class,"android.widget.TextView") and @text="Penggalangan Dana"]
${patientLabel}             xpath=//*[@resource-id="com.kitabisa.android.staging:id/textViewTitle"][@text="Pasien"]
${patientName}              id=com.kitabisa.android.staging:id/textPatientName
${deseasName}               id=com.kitabisa.android.staging:id/textDisease
${penyalurLabel}            xpath=//*[@resource-id="com.kitabisa.android.staging:id/textViewTitle"][@text="Penyalur dana"]
${beneficiaryLabel}         xpath=//*[@resource-id="com.kitabisa.android.staging:id/textViewTitle"][@text="Penerima dana"]
${beneficiaryName}          id=com.kitabisa.android.staging:id/textBeneficiaryName
${ceritaSection}            xpath=//*[contains(@resource-id, "textViewStoryTitle") and @text= "Cerita"]
${bacaSelengkapnyaBtn}      xpath=//*[contains(@resource-id, "buttonShowMore") and @text= "Baca Selengkapnya"]
${sembunyikanBtn}           xpath=//*[contains(@resource-id, "buttonShowMore") and @text= "Sembunyikan"]
${dateTxt}                  id=com.kitabisa.android.staging:id/textViewDate
${newsUpdateText}           id=com.kitabisa.android.staging:id/textVewUpdates
${showMoreBtn}              id=com.kitabisa.android.staging:id/buttonShowMore
${campaignDetailDoa}        xpath=//*[@text="Doa-doa #OrangBaik"]
${sortingDoa}               xpath=(//*[@class="android.view.ViewGroup"]/*[@class="android.widget.FrameLayout"]/*[@class="android.widget.Spinner"])[1]
${emptyDoa}                 xpath=//*[@text="Belum ada doa di penggalangan ini"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/textViewEmptyUpdates"]
${1stCardDoa}               xpath=//*[@class="android.widget.FrameLayout"]/*[@class="android.view.ViewGroup"]/*[@class="androidx.recyclerview.widget.RecyclerView"]/*[@class="androidx.cardview.widget.CardView"][1]
${lastCardDoa}              xpath=//*[@class="android.widget.FrameLayout"]/*[@class="android.view.ViewGroup"]/*[@class="androidx.recyclerview.widget.RecyclerView"]/*[@class="androidx.cardview.widget.CardView"][3]
${sortDoaByPopuler}         xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[2]
${donationAmountText}       xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewDonationAmount"])[1]
${lastdonationAmount}       xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewDonationAmount"])[3]
${donationListSort}         xpath=(//*[@class="android.view.ViewGroup"]/*[@class="android.widget.FrameLayout"]/*[@class="android.widget.Spinner"])[2]
${donationMostSort}         xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[2]
${1stDonorsList}            xpath=(//*[@resource-id="com.kitabisa.android.staging:id/textViewName"])[1]
${fundraiserSection}        xpath=//*[contains(@resource-id, "textViewStoryTitle") and @text= "Fundraiser"]
${firstFundraiser}          ${fundraiserSection}/parent::*[@class="android.view.ViewGroup"]/following-sibling::*[@class="androidx.cardview.widget.CardView"]
${shareCampaignSection}     id=com.kitabisa.android.staging:id/textViewShareTitle
${whatsappBtn}              id=com.kitabisa.android.staging:id/buttonWhatsApp
${facebookBtn}              id=com.kitabisa.android.staging:id/buttonFacebook
${donasiRutinInfo1}         id=com.kitabisa.android.staging:id/viewTag1
${donasiRutinInfo2}         id=com.kitabisa.android.staging:id/viewTag2
${donasiRutinTerkumpul}     id=com.kitabisa.android.staging:id/viewInfo
${closeInfo}                id=com.kitabisa.android.staging:id/buttonClose
${ediTextNominal}           id=com.kitabisa.android.staging:id/editTextNominal
${paymentMethodBtn}         id=com.kitabisa.android.staging:id/textViewPaymentMethod
${continuePaymentBtn}       id=com.kitabisa.android.staging:id/buttonContinuePayment
${fillDoa}                  id=com.kitabisa.android.staging:id/editTextComment
${reportPenggalangan}       id=com.kitabisa.android.staging:id/title
${noAmountErromsg}          xpath=//*[contains(@text, "Silakan isi nominal donasi")]
${500Erromsg}               xpath=//*[contains(@text, "Min. donasi sebesar Rp1.000")]
${multiErromsg}             xpath=//*[contains(@text, "Isi nominal donasi dalam kelipatan ribuan")]
${pembErrosmsg}             xpath=//*[contains(@text, "Silakan pilih metode pembayaranmu")] 

*** Keywords ***
Validate User Directed to Campaign Detail Page Properly
    wait until page contains element        ${donasiBtn}
    page should contain element             ${campaignTitleTxt}
    page should contain element             ${loveButton}

Validate Top Menu
    Scroll Down to Element                  ${penggalangLabel}        ${contentContainer}
    page should contain element             ${shareTopBtn}
    page should contain element             ${optionTopBtn}
    Log to console                          Validate Top Menu is OK

Click Love Icon
    wait until page contains element        ${loveButton}
    click element                           ${loveButton}

Go to News Update
    Scroll Down to Element                  ${newsUpdateText}       ${contentContainer}
    page should contain element             ${newsUpdateText}

Validate Info Penggalang Dana section is Showing   
    Scroll Down to Element                  ${galangDanaSection}    ${contentContainer}
    page should contain element             ${campaignerName}
    Log to console                          Info Penggalangan dana is OK

Go to Penggalang Dana Section
    click element                           ${campaignerName}

Verify Penggalang Page
    wait until page contains element        ${headerPenggalangPage}
    page should contain element             ${aboutPenggalangPage}
    page should contain element             ${listPenggalangPage}

Validate Penyalur or Penerima Dana
    ${result}=      run keyword and return status       wait until element is visible       ${penyalurLabel}    timeout=5
    run keyword if      '${result}'=='True'             page should contain element         ${penyalurLabel}
    ...       ELSE      page should contain element     ${beneficiaryLabel}
    Log to console                          Penyalur dana is OK

Validate Cerita Section
    Scroll Down to Element                  ${bacaSelengkapnyaBtn}      ${contentContainer}
    Log to console                          Cerita section is OK

Validate Pasien Name section is Showing
    short scrolling down                    ${contentContainer}         1
    ${result}=      run keyword and return status       wait until page contains element    ${patientName}      timeout=1
    run keyword if  '${result}'=='True'                 page should contain element         ${patientName}
    ...     ELSE    Log to console      There is no Pasien section

Validate Diagnosis section is Showing
    ${result}=      run keyword and return status       wait until page contains element    ${penyalurLabel}    timeout=1
    run keyword if  '${result}'=='True'                 page should contain element         ${deseasName}
    ...       ELSE  Log to console       There is no desease section

Verify Baca Selengkapnya Button Is Showing
    Scroll Down to Element                  ${bacaSelengkapnyaBtn}      ${contentContainer}
    page should contain element             ${bacaSelengkapnyaBtn}
    Log to console                          Baca Cerita Lengkap is OK
    
Verify Baca Selengkapnya Is Clickable 
    click element                           ${bacaSelengkapnyaBtn}
    page should not contain element         ${bacaSelengkapnyaBtn}

Verify Sembunyikan Cerita
    Scroll Down to Element                  ${sembunyikanBtn}          ${contentContainer}
    click element                           ${sembunyikanBtn}

Verify Donor List
    Scroll Down to Element                  ${donationAmountText}      ${contentContainer}
    page should contain element             ${donationAmountText}
    Log to console                          Donors Section is OK

Sort The Most Donor List
    click element                           ${donationListSort}
    wait until page contains element        ${donationMostSort}
    click element                           ${donationMostSort}

Click Button Show More Donors List
    Scroll Down to Element                  ${lastdonationAmount}   ${contentContainer}
    click element                           ${showMoreBtn}

Verify Doa Section on Campaign Detail
    Scroll Down to Element                  ${sortingDoa}           ${contentContainer}
    page should contain element             ${campaignDetailDoa}
    page should contain element             ${sortingDoa}
    Log to console                          Doa section is OK

Verify Sorting Doa on Campaign Detail
    click element                           ${sortingDoa}
    click element                           ${sortDoaByPopuler}

Verify Doa List is Exist
    short scrolling down                    ${contentContainer}     1
    ${status}       run keyword and return status       wait until element is visible       ${emptyDoa}     timeout=2
    run keyword if      '${status}'=='True'             Log to console      Doa is empty
    ...     ELSE        page should contain element     ${1stCardDoa}

Validate Fundraiser is Exist
    Long Scrolling Down                     ${contentContainer}     5
    ${result}=      run keyword and return status       wait until page contains element    ${fundraiserSection}    timeout=2
    run keyword if      '${result}'=='True'             log to console      Fundraiser campaign is OK
    ...       ELSE      log to console          Campaign doesn't have fundraiser

Go to Fundraiser Page
    Long Scrolling Down                     ${contentContainer}     5
    ${result}=      run keyword and return status       wait until page contains element    ${fundraiserSection}    timeout=2
    run keyword if      '${result}'=='True'     run keywords            log to console      Fundraiser campaign is OK
    ...       AND       click element           ${firstFundraiser}
    ...       AND       Verify All Section on Campaign Detail
    ...       ELSE      log to console          Campaign doesn't have fundraiser

Validate Share Campaign Section
    Scroll Down to Element                  ${shareCampaignSection}  ${contentContainer}
    page should contain element               ${whatsappBtn}
    page should contain element               ${facebookBtn}
    log to console                          Share Section is OK

Input Donation Amount
    [Arguments]         ${nominal}
    wait until page contains element        ${ediTextNominal}
    input text                              ${ediTextNominal}       ${nominal}

Click on Back Button
    wait until page contains element        ${backIcon}
    click element                           ${backIcon}

Click on Donasi Button
    wait until page contains element        ${donasiBtn}
    click element                           ${donasiBtn}

Click on Payment Method options
    wait until page contains element        ${paymentMethodBtn}
    click element                           ${paymentMethodBtn}

Click Continue Payment
    wait until page contains element        ${continuePaymentBtn}
    click element                           ${continuePaymentBtn}

Click Continue Payment Monkey
    [Arguments]         ${times}

    FOR     ${index}     IN RANGE    0      ${times}
            ${status}=    run keyword and return status          element should be visible        ${continuePaymentBtn}
            run keyword if      '${status}'=='True'              click element                    ${continuePaymentBtn}
            ...     ELSE        run keyword                      Exit For Loop
    END
Error Message without amount
    wait until page contains element        ${noAmountErromsg}

Error Message for 500
    wait until page contains element        ${500Erromsg}

Error Message for not in multiple thousands
    wait until page contains element        ${multiErromsg}

Error Message for metode pembayaran
    wait until page contains element        ${pembErrosmsg}

Verify Donasi Rutin Info
    page should contain element       ${donasiRutinInfo1}
    page should contain element       ${donasiRutinInfo2}
    page should contain element       ${donasiRutinTerkumpul}

View Donasi Rutin Info
    click element                   ${donasiRutinInfo1}

Close Info Donasi Rutin
    click element                   ${closeInfo}

Input Doa
    [Arguments]                     ${doa}
    wait until element is visible   ${fillDoa}
    Input Text                      ${fillDoa}      ${doa}

Lihat Semua Doa on Campaign Detail
    Scroll Down to Element          ${campaignDetailDoa}        ${contentContainer}
    Scroll Down to Element          ${lastCardDoa}              ${contentContainer}
    wait until element is visible   ${showMoreBtn}              timeout=10s        
    click element                   ${showMoreBtn}

Click Option Report Penggalangan
    click element                   ${optionTopBtn}
    wait until element is visible   ${reportPenggalangan}
    click element                   ${reportPenggalangan}

# Validate Family Card section is Showing
#     Wait Until Element Is Visible   ${verifIconThree}         timeout=5
#     page should contain element       ${verifIconThree}

# Validate Bank Account section is Showing
#     Wait Until Element Is Visible   ${verifIconFour}          timeout=5
#     page should contain element       ${verifIconFour}

# Verify Patient Name Should be same as Beneficiary Name
#     Scroll Up to Element            ${imageCampaign}                    ${contentContainer}
#     Scroll Down to Element          ${patientName}                      ${contentContainer}
#     ${first}=       Get Text                    ${patientName}
#     ${second}=      Get Text                    ${beneficiaryName}
#     Should Be Equal     ${first}       ${second}

# Verify Campaigner Relationship Should be same as Beneficiary Relationship
#     ${first}=       Get Text                    ${campRelationship}
#     ${second}=      Get Text                    ${benRelationship}
#     Should Be Equal     ${first}       ${second}

# Verify Patient Name Should different with Beneficiary Name
#     ${first}=       Get Text                    ${patientName}
#     ${second}=      Get Text                    ${beneficiaryName}
#     Should Not Be Equal     ${first}       ${second}
