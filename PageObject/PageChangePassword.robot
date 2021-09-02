*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${passwordBackButton}           xpath=//*[@resource-id="com.kitabisa.android.staging:id/toolbar"]/android.widget.ImageButton[1]
${passwordOldText}              id=com.kitabisa.android.staging:id/editTextOldPassword
${passwordNewText}              id=com.kitabisa.android.staging:id/editTextNewPassword
${passwordConfirmText}          id=com.kitabisa.android.staging:id/editTextConfirmNewPassword
${passwordUpdateButton}         id=com.kitabisa.android.staging:id/buttonUpdatePassword
${passwordShowOld}              xpath=//*[@resource-id="com.kitabisa.android.staging:id/textInputOldPassword"]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.ImageButton[1]
${passwordShowNew}              xpath=//*[@resource-id="com.kitabisa.android.staging:id/textInputNewPassword"]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.ImageButton[1]
${passwordShowConfirm}          xpath=//*[@resource-id="com.kitabisa.android.staging:id/textInputConfirmNewPassword"]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.ImageButton[1]
${closeBtn}                     id=com.kitabisa.android.staging:id/buttonClose

*** Keywords ***
Input Old Password
    [Arguments]     ${oldPassword}
    wait until page contains element    ${passwordOldText}
    input password                      ${passwordOldText}      ${oldPassword}
    click element                       ${passwordShowOld}

Input New Password
    [Arguments]     ${newPassword}
    input password                      ${passwordNewText}      ${newPassword}
    click element                       ${passwordShowNew}

Input Confirm Password
    [Arguments]     ${confirmPassword}
    input password                      ${passwordConfirmText}  ${confirmPassword}
    click element                       ${passwordShowConfirm}
    set global variable                 ${newPassword}          ${confirmPassword}

Click Update Button
    click element                       ${passwordUpdateButton}

Validate Confirm Password Not Match
    wait until page contains            Kata sandi baru tidak sesuai

Validate Success Change Password
    wait until page contains element    ${closeBtn}
    click element                       ${closeBtn}
