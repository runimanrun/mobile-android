*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
${tncHepCenterTextView}         xpath=//*[@text="Kitabisa Help Center"]
${tncContainer}                 xpath=//*[@resource-id="android:id/content"]/android.view.ViewGroup[1]/android.webkit.WebView[1]/android.webkit.WebView[1]/android.view.View[2]

*** Keywords ***
Verify Help Center Title
    wait until page contains element    ${tncHepCenterTextView}
    page should contain element         ${tncHepCenterTextView}

Scroll Down Tnc Page
    Long Scrolling Down                 ${tncContainer}     5
    sleep  2
