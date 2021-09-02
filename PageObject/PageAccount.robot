*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variables ***
${accountPageContainer}     id=com.kitabisa.android.staging:id/recyclerView
${titleAkun}                xpath=//*[@text="Account"]
${avatarView}               id=com.kitabisa.android.staging:id/cardViewAvatar
${popupImageView}           xpath=//*[@resource-id="com.kitabisa.android.staging:id/inapp_half_interstitial_image_frame_layout"]/android.widget.ImageView
${nameViewText}             id=com.kitabisa.android.staging:id/textViewName
${profileButton}            xpath=//*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]/android.view.ViewGroup[1]
${dompetkebaikanText}       xpath=//*[@text="Dompet Kebaikan"]
${settingsButton}           xpath=//*[@text="Pengaturan"]
${settingshelpButton}       xpath=//*[@text="Bantuan"]
${settingstncButton}        xpath=//*[@text="Syarat dan Ketentuan"]
${logoutButton}             xpath=//*[@text="Keluar"]
${confirmLogoutButton}      id=com.kitabisa.android.staging:id/buttonConfirmed
${ReminderDonationText}     xpath=//*[@text="Pengingat donasi"]
${switchReminderDonation}   xpath=//*[@text="Pengingat donasi"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/switchSetting"]
${MenunaikanZakatText}      xpath=//*[@text="Saya menunaikan zakat"]
${switchZakatSetting}       xpath=//*[@text="Saya menunaikan zakat"]/..//*[contains(@resource-id, "switchSetting")]
${selectorZakat}            id=com.kitabisa.android.staging:id/text1
${setMonthly}               xpath=//*[@text="Sebulan sekali"]
${setYearly}                xpath=//*[@text="Setahun sekali"]
${incomeField}              id=com.kitabisa.android.staging:id/editTextIncome
${otherIncome}              id=com.kitabisa.android.staging:id/editTextAnotherIncome
${debtInstallment}          id=com.kitabisa.android.staging:id/editTextDebtInstallment
${saveZakatButton}          id=com.kitabisa.android.staging:id/buttonSaveZakat
${backButton}               xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
${lastTrxHistory}           id=com.kitabisa.android.staging:id/textViewWalletAmount
${refreshWalletPage}        id=com.kitabisa.android.staging:id/swipeRefreshLayout
${contentUpdate}            //*[contains(@resource-id, "textViewType")]
${donasirutintex}           xpath=//*[@text="Donasi Rutin"]  
${tentangkitatext}          xpath=//*[@text="Tentang Kitabisa"] 
${akuntranstext}            xpath=//*[@text="Akuntabilitas dan Transparansi"]
${beriratingtext}           xpath=//*[@text="Beri rating aplikasi Kitabisa"]


*** Keywords ***
Title in the Top is Akun
    wait until page contains element   ${titleAkun}
    page should contain element        ${titleAkun} 

Verify text Dompet Kebaikan
    wait until page contains element   ${dompetkebaikanText}
    page should contain element        ${dompetkebaikanText}

Verify Account Page
    ${result}=      run keyword and return status       wait until page contains element    ${popupImageView}       timeout=5
    run keyword if  '${result}'=='True'                 click element                       ${popupImageView}

    wait until page contains element    ${avatarView}
    page should contain element         ${avatarView}
    page should contain element         ${nameViewText}

Verify Last Wallet Transaction
    wait until page contains element    ${lastTrxHistory}

Verify Wallet List History
    wait until page contains element    xpath=${contentUpdate}
    ${updateCount}                      get matching xpath count       ${contentUpdate}
    ${indexContentUpdate}               catenate                       SEPARATOR=          xpath=${contentUpdate}    [${UpdateCount}]
    ${firstPageTitle}                   get text                       ${contentUpdate}

    FOR     ${PAGE}     IN RANGE        5
       Long Scrolling Down              ${refreshWalletPage}        1
       ${updateCount}                   Get Matching Xpath Count       ${contentUpdate}
       ${updateCount}                   Evaluate                       ${updateCount}-1
       ${indexContentUpdate}            catenate                       SEPARATOR=          xpath=${contentUpdate}    [${UpdateCount}]
       ${lastPageTitle}                 get text                       ${contentUpdate}
       ${isSame}                        run keyword and return status  Should Be Equal       ${firstPageTitle}   ${lastPageTitle}
       Exit For Loop If                 ${isSame}
       Set Global Variable              ${firstPageTitle}            ${lastPageTitle}
    END


Click Profile
    wait until page contains element    ${profileButton}
    click element                       ${profileButton}

Verify Settings
    wait until page contains element    ${settingsButton}
    
Click Settings
    wait until page contains element    ${settingsButton}
    click element                       ${settingsButton}

Verify Help
    wait until page contains element    ${settingshelpButton}

Click Help
    wait until page contains element    ${settingshelpButton}
    click element                       ${settingshelpButton}

Verify Term and Conditions
    Scroll Down to Element              ${settingstncButton}        com.kitabisa.android.staging:id/viewPager
    wait until page contains element    ${settingstncButton}

Click Term and Conditions
    Scroll Down to Element              ${settingstncButton}        com.kitabisa.android.staging:id/viewPager
    wait until page contains element    ${settingstncButton}
    click element                       ${settingstncButton}

Click Logout
    Scroll Down to Element              ${logoutButton}             com.kitabisa.android.staging:id/viewPager
    wait until page contains element    ${logoutButton}
    click element                       ${logoutButton}
    wait until page contains element    ${confirmLogoutButton}
    click element                       ${confirmLogoutButton}
    sleep   2

Verify Reminder Donation
    wait until element is visible       ${ReminderDonationText}
    wait until element is visible       ${switchReminderDonation}

Click Switch Reminder Donation
    wait until element is visible       ${switchReminderDonation}
    click element                       ${switchReminderDonation}
    sleep  1

Verify Saya menunaikan zakat
    wait until element is visible       ${MenunaikanZakatText} 
    wait until element is visible       ${switchZakatSetting}

Click Switch Zakat Setting
    wait until element is visible       ${switchZakatSetting}
    click element                       ${switchZakatSetting}

Select Zakat Period
    wait until element is visible       ${selectorZakat}
    click element                       ${selectorZakat}
    ${passed} =                         run keyword and return status           Monthly Period
    run keyword if                      '${passed}' != 'True'                   Yearly Period    
    ...     ELSE                        log                                     do nothing  

Monthly Period
    wait until element is visible       ${setMonthly}       
    click element                       ${setMonthly}

Yearly Period
    wait until element is visible       ${setYearly}
    click element                       ${setYearly}

Input Zakat Income 
    [Arguments]     ${text}
    wait until element is visible       ${incomeField}
    Input Text                          ${incomeField}                  ${text}            

Input Zakat Other Income
    [Arguments]     ${text}
    wait until element is visible       ${otherIncome}
    Input Text                          ${otherIncome}                  ${text}

Input Zakat Debt Installment
    [Arguments]     ${text}
    wait until element is visible       ${debtInstallment}
    Input Text                          ${debtInstallment}              ${text}

Verify Lanjut Button Is Visible
    Element Should Be Visible           ${saveZakatButton}
    click element                       ${saveZakatButton}

Click Back Button
    wait until element is visible       ${backButton}
    click element                       ${backButton}

Verify donasi rutin
    wait until element is visible       ${donasirutintex}

Verify tentang kitabisa
    Scroll Down to Element              ${tentangkitatext}        com.kitabisa.android.staging:id/viewPager
    wait until page contains element    ${tentangkitatext}

Verify akuntabiitas dan transparasi
    wait until element is visible       ${akuntranstext}

Verify beri rating applikasi
    Scroll Down to Element              ${beriratingtext}             ${accountPageContainer}
    wait until element is visible       ${beriratingtext} 