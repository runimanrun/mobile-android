*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
${helpReadytoHelp}              id=com.kitabisa.android.staging:id/textViewWeReadyToHelpYou
${helpQuestionAbout}            id=com.kitabisa.android.staging:id/textViewHaveQuestionAboutDonation
${helpAskQuestionButton}        id=com.kitabisa.android.staging:id/faqContainer
${helpCenterContainer}          xpath=//*[@resource-id="android:id/content"]/android.view.ViewGroup[1]/android.webkit.WebView[1]
${helpCenterNeedHelp}           xpath=//*[@text="Halo, ada yang bisa kami bantu?"]
${helpSearchHelpText}           xpath=//*[@resource-id="root"]/android.view.View[2]/android.view.View[1]/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.view.View[1]/android.widget.EditText[1]
${helpCamapignTextView}         xpath=//*[@resource-id="android:id/content"]/android.view.ViewGroup[1]/android.webkit.WebView[1]/android.webkit.WebView[1]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.widget.ListView[1]/android.view.View[2]
${helpDonaturTextView}          xpath=//*[@resource-id="android:id/content"]/android.view.ViewGroup[1]/android.webkit.WebView[1]/android.webkit.WebView[1]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.widget.ListView[1]/android.view.View[3]
${helpGeneralTextView}          xpath=//*[@resource-id="android:id/content"]/android.view.ViewGroup[1]/android.webkit.WebView[1]/android.webkit.WebView[1]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.widget.ListView[1]/android.view.View[4]
${helpTabQuestionButton}        xpath=//*[@resource-id="root"]/android.view.View[2]/android.view.View[1]
${helpContactUsButton}          id=com.kitabisa.android.staging:id/contactUsContainer
${helpKBTextview}               id=com.kitabisa.android.staging:id/textViewKitabisaFoundation
${helpKBAddress}                id=com.kitabisa.android.staging:id/textViewKitabisaAddress
${helpKBMail}                   id=com.kitabisa.android.staging:id/buttonMailKitabisa
${helpOtherQuestTextview}       id=com.kitabisa.android.staging:id/textViewTitle
${helpPhoneText}                id=com.kitabisa.android.staging:id/editTextPhoneNumber
${helpEmailText}                id=com.kitabisa.android.staging:id/editTextEmail
${helpTopicOption}              id=com.kitabisa.android.staging:id/spinnerTopic
${helpIssueOption}              id=com.kitabisa.android.staging:id/spinnerProblem
${helpTopicSelect}              xpath=//*[@text="Umum"]
${helpIssueSelect}              xpath=//*[@text="Laporan Publik"]          
${helpQuestionandAdviceText}    id=com.kitabisa.android.staging:id/editTextQuestion
${helpSendButton}               id=com.kitabisa.android.staging:id/buttonSend
${helpPopupMessageSent}         id=com.kitabisa.android.staging:id/textViewTitle
${helpPopupCreateNewButton}     id=com.kitabisa.android.staging:id/buttonCancelled
${helpPopupBackButton}          id=com.kitabisa.android.staging:id/buttonConfirmed
${helpImagePopup}               id=com.kitabisa.android.staging:id/half_interstitial_image_relative_layout
${helpImagePopupClose}          xpath=//*[@resource-id="com.kitabisa.android.staging:id/inapp_half_interstitial_image_frame_layout"]/android.widget.ImageView[1]

*** Keywords ***
Verify Help Page
    ${result}=      run keyword and return status       Wait Until Page Contains Element    ${helpImagePopup}       timeout=10
    run keyword if  '${result}'=='True'                 Click Element                       ${helpImagePopupClose}

    wait until page contains element    ${helpReadytoHelp}
    page should contain element         ${helpQuestionAbout}
    page should contain element         ${helpAskQuestionButton}
    page should contain element         ${helpKBTextview}
    page should contain element         ${helpKBAddress}
    page should contain element         ${helpKBMail}

Click Frequently Ask Question
    click element                       ${helpAskQuestionButton}

Verify Help Center Page
    wait until page contains element    ${helpCenterNeedHelp}
    page should contain element         ${helpCenterNeedHelp}
    page should contain element         ${helpSearchHelpText}

Click Campaigner Text View
    click element                       ${helpCamapignTextView}
    wait until page contains element    ${helpCenterContainer}
    Long Scrolling Down                 ${helpCenterContainer}      5

Click Donatur Text View
    click element                       ${helpDonaturTextView}
    wait until page contains element    ${helpCenterContainer}
    Long Scrolling Down                 ${helpCenterContainer}      5

Click General Text View
    click element                       ${helpGeneralTextView}
    wait until page contains element    ${helpCenterContainer}
    Long Scrolling Down                 ${helpCenterContainer}      5

Click Contact Us via Email
    click element                       ${helpContactUsButton}

Verify Help Contact Us Page
    wait until page contains element    ${helpOtherQuestTextview}
    page should contain element         ${helpOtherQuestTextview}

Input Phone Number
    [Arguments]     ${phoneNumber}
    input text                          ${helpPhoneText}                ${phoneNumber}

Input Email
    [Arguments]     ${email}
    input text                          ${helpEmailText}                ${email}

Validate Invalid Email Format
    page should contain text            Format email salah

Validate Minimum Char Question
    page should contain text            Minimal 30 karakter

Select Topic Option
    click element                       ${helpTopicOption}
    wait until page contains element    ${helpTopicSelect}
    click element                       ${helpTopicSelect}

Select Issue Option
    click element                       ${helpIssueOption}
    wait until page contains element    ${helpIssueSelect}
    click element                       ${helpIssueSelect}

Input Question Advice
    [Arguments]     ${questionAdvice}
    input text                          ${helpQuestionandAdviceText}    ${questionAdvice}

Click Send Button
    Scroll Down to Element              ${helpSendButton}       id=com.kitabisa.android.staging:id/scrollView
    click element                       ${helpSendButton}

Vefify Message Sent
    sleep   2
    wait until page contains element    ${helpPopupMessageSent}
    page should contain element         ${helpPopupMessageSent}

Click Popup Create New Button
    click element                       ${helpPopupCreateNewButton}

Click Popup Back Button
    click element                       ${helpPopupBackButton}
