*** Settings ***
Library     AppiumLibrary       timeout=60

*** Variable ***
${frequencyMonth}           id=com.kitabisa.android.staging:id/buttonFrequency
${frequencyDate}            id=com.kitabisa.android.staging:id/buttonDate
${frequencyTime}            id=com.kitabisa.android.staging:id/buttonTime
${frequencyOptionDay}       xpath=//*[@text="Hari"]
${frequencyOptionWeek}      xpath=//*[@text="Minggu"]
${frequencyOptionMonth}     xpath=//*[@text="Bulan"]
${saveReminderButton}       id=com.kitabisa.android.staging:id/buttonSaveReminder

*** Keywords ***
Verify Reminder Donation Screen
    wait until page contains            Ingatkan Saya Donasi
    page should contain element         ${frequencyMonth}
    page should contain element         ${frequencyDate}
    page should contain element         ${frequencyTime}

Verify Success Set Reminder
    wait until page contains            Pengingat donasi berhasil diaktifkan

Select Monthly Frequency
    wait until page contains element    ${frequencyOptionMonth}
    click element                       ${frequencyOptionMonth}

Click Month Frequency
    click element                       ${frequencyMonth}

Click Date Frequency
    click element                       ${frequencyDate}

Click Time Frequency
    click element                       ${frequencyTime}

Click Save Reminder Button
    click element                       ${saveReminderButton}
