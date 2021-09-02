*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestForgotPassword.robot
Resource    ../../Test/TestRegister.robot
Resource    ../../Var/var.robot
Resource    ../../Utils/testrails.robot

Suite Setup         Start Application
Test Setup          Launch Application
Test Teardown       Update Status       ${TEST STATUS}      ${TEST DOCUMENTATION}       ${TEST MESSAGE}
Suite Teardown      After Suite

*** Keywords ***
After Suite
    Remove Application      com.kitabisa.android.staging
    Close Application

*** Test Case ***
C3676 User Register with Existing Email
    [Tags]      register        regression      negative
    [Documentation]     ${3676}
    Register with Existing Email                                ${activationEmail}       ${nameToRegis}

C3677 User Register with Empty Phone Number or Email and Name
    [Tags]      register        regression      negative
    [Documentation]     ${3677}
    Register with Empty Phone Number or Email and Name

C9648 Register with Empty Name
    [Tags]      register        regression      negative
    [Documentation]     ${9648}
    Register with Empty Name            teta.kibites@gmail.com

C3678 User Register with Invalid Email Format
    [Tags]      register        regression      negative
    [Documentation]     ${3678}
    Register with Invalid Email or Phone Format                 teta.kibites.com@gmail

C9655 User Register with Invalid Fullname
    [Tags]      register        regression      negative
    [Documentation]     ${9655}
    Register with Invalid Fullname Format       teta.kibitesnew@gmail.com

C9652 User Register Resend OTP
    [Tags]      register        regression        positive
    [Documentation]     ${9652}
    Register with Resend OTP                      ${unregisEmail}         ${nameToRegis}

C9651 User Register with Invalid Email OTP Key
    [Tags]      register        regression      negative
    [Documentation]     ${9651}
    Register with Invalid Email OTP Key                         ${unregisEmail}         ${nameToRegis}

# C9656 User Register with 3 Times Invalid Email OTP Key
#     [Tags]      register        regression      negative
#     [Documentation]     ${9656}
#     Register with 3 Times Invalid OTP Key                         ${unregisEmail}         ${nameToRegis}

C3680 User Register using Email with Password Less Than Minimum Char
    [Tags]      register        regression      negative
    [Documentation]     ${3680}
    Register using Email with Password Less Than Minimum Char   ${emailToRegis}         ${nameToRegis}

C3681 User Register using Email with Invalid Confirm Password
    [Tags]      register        regression      negative
    [Documentation]     ${3681}
    Register using Email with Invalid Confirm Password          ${emailToRegis}         ${nameToRegis}

C3682 User Register with Email
    [Tags]      register        regression      positive
    [Documentation]     ${3682}
    Register with Email                                         ${emailToRegis}         ${nameToRegis}
    Logout Process

C3683 User Register with Existing Phone Number
    [Tags]      register        regression      negative
    [Documentation]     ${3683}
    Register with Existing Phone Number                         ${phoneLogin}           ${nameToRegis}

C3684 User Register with Invalid Phone Format
    [Tags]      register        regression      negative
    [Documentation]     ${3684}
    Register with Invalid Email or Phone Format                 08120812o8i1

C3685 User Register with Invalid Phone OTP Key
    [Tags]      register        regression      negative
    [Documentation]     ${3685}
    Register with Invalid Phone OTP Key                         ${phoneToRegis}         ${nameToRegis}

C3686 User Register using Phone with Password Less Than Minimum Char
    [Tags]      register        regression      negative
    [Documentation]     ${3686}
    Register using Phone with Password Less Than Minimum Char   ${phoneToRegis}         ${nameToRegis}

C3687 User Register using Phone with Invalid Confirm Password
    [Tags]      register        regression      negative
    [Documentation]     ${3687}
    Register using Phone with Invalid Confirm Password          ${phoneToRegis}         ${nameToRegis}

C3688 User Register with Phone Number
    [Tags]      register        regression      positive
    [Documentation]     ${3688}
    Register with Phone Number                                  ${phoneToRegis}         ${nameToRegis}
    Logout Process

C9954 Forgot Password with Unregistered Email
    [Tags]      forgot      regression      negative
    [Documentation]     ${9954}
    Forgot Password with Unregistered Email                     ${unregisEmail}

C9955 Forgot Password with Unregistered Phone Number
    [Tags]      forgot      regression      negative
    [Documentation]     ${9955}
    Forgot Password with Unregistered Phone Number              ${unregisPhone}

C3703 Forgot Password Using Phone Number
    [Tags]      forgot      regression      positive
    [Documentation]     ${3703}
    Forgot Password Using Existing Account                ${phoneLogin}            SMS

C3704 Forgot Password Using Email
    [Tags]      forgot      regression      positive
    [Documentation]     ${3704}
    Forgot Password Using Existing Account                ${activationEmail}        EMAIL

C3702 Forgot Password with 3 Times Invalid OTP
    [Tags]      forgot      regression      negative
    [Documentation]     ${3702}
    Forgot Password with 3 Times Invalid OTP                    ${activationEmail}

C3694 User Login with Invalid Phone Format
    [Tags]      login       regression      negative
    [Documentation]     ${3694}
    Login with Invalid Email or Phone Format                    08120812o8i1

C9949 User Login with Unregistered Phone
    [Tags]      login       regression      negative
    [Documentation]     ${9949}
    Login with Unregistered Phone                               ${unregisPhone}

C3697 User Login with Phone and Password
    [Tags]      login       regression      positive
    [Documentation]     ${3697}
    Login with Phone and Password                               ${phoneLogin}        ${phonePassword}

C3695 User Login with Phone 3 Times Invalid Password
    [Tags]      login       regression      negative
    [Documentation]     ${3695}
    Login with 3 Times Invalid Password                         ${phoneLogin}

C3696 User Login with 3 Times Invalid Phone OTP Key
    [Tags]      login       regression      negative
    [Documentation]     ${3696}
    Login with 3 Times Invalid Phone OTP Key                    ${phoneLogin}

C3698 User login with whatsapp OTP
    [Tags]      login       regression      positive
    [Documentation]     ${3698}
    Login with Whatsapp and OTP                                 ${phoneLogin}

C3689 User Login with Empty Phone Number or Email
    [Tags]      login       regression      negative
    [Documentation]     ${3689}
    Login with Empty Phone Number or Email

C3690 User Login with Invalid Email Format
    [Tags]      login       regression      negative
    [Documentation]     ${3690}
    Login with Invalid Email or Phone Format                    teta.kibites.com@gmail

C9948 User Login with Unregistered Email
    [Tags]      login       regression      negative
    [Documentation]     ${9948}
    Login with Unregistered Email                               ${unregisEmail}

# C14943 User Change Email When Login
#     [Tags]      login       regression      positive
#     [Documentation]         ${14943}
#     Login with Change Email                 ${activationEmail}      hisyammukh76@gmail.com

C3693 User Login with Email and Password
    [Tags]      login       regression      positive
    [Documentation]     ${3693}
    Login with Email and Password                               ${activationEmail}     ${activationPassword}

C3700 User Logout
    [Tags]    Logout    regression    positive
    [Documentation]     ${3700}
    Logout Process

C3691 User Login with Email 3 Times Invalid Password
    [Tags]      login       regression      negative
    [Documentation]     ${3691}
    Login with 3 Times Invalid Password                         ${activationEmail}

C3692 User Login with 3 Times Invalid Email OTP Key
    [Tags]      login       regression      negative
    [Documentation]     ${3692}
    Login with 3 Times Invalid Email OTP Key                    ${activationEmail}
