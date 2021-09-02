*** Settings ***
Library     AppiumLibrary
Library     DateTime

Resource    ../Var/var.robot
Resource    ../Api/cloud/getAvailableDevice.robot
Resource    ../Api/utils/config.robot

*** Keywords ***
Start Application on Local
    Open Application    ${appiumLocal}
    ...     platformName=android    platformVersion=${platformVersion}
    ...     app=${app}     appPackage=com.kitabisa.android.staging      appActivity=com.kitabisa.android.ui.splash.SplashActivity
    ...     newCommandTimeout=60000      noReset=true      autoGrantPermissions=true
    ...     unicodeKeyboard=true        resetKeyboard=true      automationName=uiautomator2

Start Application on Cloud
    ${date}=        Get Current Date    UTC     + 7 hours   result_format=%d-%b-%Y %H:%M
    ${deviceName}   ${osVersion}        Get Available Device
    Open Application    https://${usernamecloud}:${apiKeyCloud}@${domainCloud}/wd/hub
    ...     app=bs://${appId}
    ...     platformName=android            platformVersion=${osVersion}    device=${deviceName}
    ...     newCommandTimeout=60000         noReset=true                    autoGrantPermissions=true
    ...     unicodeKeyboard=true            resetKeyboard=true              automationName=uiautomator2
    ...     browserstack.idleTimeout=60     name=Regression, ${date} [${SUITE NAME}]

Start Application
    run keyword if      '${isCloud}'=='true'        Run Keyword     Start Application on Cloud
    ...     ELSE        Run Keyword                 Start Application on Local
