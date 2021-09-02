*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Library     DatabaseLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestChangeProfile.robot
Resource    ../../Test/TestCampaignDetail.robot
Resource    ../../Test/TestFavorite.robot
Resource    ../../Test/TestInbox.robot
Resource    ../../Test/TestDonasiSaya.robot
Resource    ../../Test/TestSetting.robot
Resource    ../../Test/TestSearch.robot
Resource    ../../Test/TestBanner.robot
Resource    ../../Test/TestGalangDanaMendesak.robot
Resource    ../../Test/TestKategoriFavorit.robot
Resource    ../../Test/TestDonation.robot
Resource    ../../Test/TestSalingJaga.robot
Resource    ../../Test/TestDompetKebaikan.robot
Resource    ../../Var/var.robot
Resource    ../../Test/TestHome.robot
Resource    ../../Test/TestKategoriFavorit.robot
Resource    ../../Test/TestPilihanKitabisa.robot
Resource    ../../Utils/testrails.robot
Resource    ../../Test/TestDoa.robot
Resource    ../../Test/TestChangePassword.robot
Resource    ../../Test/TestSubMenuAkun.robot

Suite Setup         Start Application
Test Setup          Launch Application
#Test Teardown       Update Status       ${TEST STATUS}      ${TEST DOCUMENTATION}       ${TEST MESSAGE}
Suite Teardown      After Suite

*** Keywords ***
After Suite
#    Remove Application      com.kitabisa.android.staging
    Close Application

*** Test Case ***
#User Login with Empty Inbox Email
#    [Tags]      login       regression      positive
#    [Documentation]     ${3692}
#    Login with Email and Password               ${noInboxEmail}     ${noInboxPassword}
#
#C8747 User View Inbox Menu for Tab Pesan
#    [Tags]      inbox       regression      positive
#    [Documentation]     ${8747}
#    Cek Empty Pesan Page
#
#C3753 User Go to Donasi From Tab Pesan
#    [Documentation]     ${3753}
#    Cek Empty Pesan Page
#    Click Button Donate From Inbox
#
#C8749 User View Inbox Menu for Tab Berita
#    [Tags]      inbox       regression      positive
#    [Documentation]     ${8749}
#    Cek Empty Berita Page
#
#C8750 User Go to Donasi From Tab Berita
#    [Tags]      inbox       regression      positive
#    [Documentation]     ${8750}
#    Cek Empty Berita Page
#    Click Button Donate From Inbox
#    Logout Process
#
#User Login with Email
#    [Tags]      login       regression     positive
#    Login with Email and Password                   ${otherEmail}     ${otherPassword}
#
#C11238 Verify Navbar on Home Page
#    [Tags]      tiles       regression      positive
#    [Documentation]     ${11238}
#    Validate Navbar Menu on Home Page
#
#C11232 Verify All Tiles Menu
#    [Tags]      tiles       regression      positive
#    [Documentation]     ${11232}
#    Validate All Tiles Menu
#
#C3750 Verify Galang Dana Tile
#    [Tags]    tile    regression    positive
#    [Documentation]     ${3750}
#    Validate Galang Dana Tile
#
#C12678 User Validate Zakat Setting on Account
#    [Tags]              zakat       regression      positive        wajib zakat
#    [Documentation]     ${12678}
#    Connect To Database    psycopg2    ${dbName}    ${Username}    ${Password}    ${dbHost}    ${dbport}
#    Check If Exists In Database        SELECT id FROM zakat_cancel WHERE user_id = '7167657';
#    Execute SQL String                 DELETE FROM zakat_cancel WHERE user_id = '7167657';
#    Verify Toggle Zakat Setting Is Active
#
#C11235 Verify Bayar Zakat Section
#    [Tags]    Zakat    regression    positive   wajib zakat
#    [Documentation]     ${11235}
#    Validate Wajib Zakat Section
#
#C8860 Change Zakat Income
#    [Tags]    zakat    regression    positive   wajib zakat
#    [Documentation]     ${8860}
#    Validate Wajib Zakat Section
#    Hitung Ulang Zakat penghasilan
#    Change Income        10000000    2500000    500000
#
#C8861 Zakat from Section on Home Page
#    [Tags]    zakat    regression    positive   wajib zakat
#    [Documentation]     ${8861}
#    Validate Wajib Zakat Section
#    Verify Bayar Zakat          Rumah Zakat       vabca
#
#C8862 User Cancel Wajib Zakat
#    [Tags]    zakat    regression    positive       wajib zakat
#    [Documentation]     ${8862}
#    Validate Wajib Zakat Section
#    Validate Cancel Wajib Zakat
#
#C8863 Verify Donasi Paling Cocok Section
#    [Tags]    donasi paling Cocok    regression    positive
#    [Documentation]     ${8863}
#    Validate Donasi Paling Cocok Section
#
#C8865 Give Recomendation Rate
#    [Tags]    donasi paling cocok        regression    positive
#    [Documentation]     ${8865}
#    Give Recomendation            donasi mania, mantaaaap!
#
#C8940 Do Donation from Donasi Paling Cocok Section
#    [Tags]    donasi paling cocok    regression    positive
#    [Documentation]     ${8940}
#    Validate Donasi Paling Cocok Section
#    Choose Campaign from Donasi Paling Cocok
#    Create VA Donation          10000       vamandiri
#
#C3749 User See Donation History
#    [Tags]      donasisaya      regression      positive
#    [Documentation]     ${3749}
#    See Donation History
#
#C11231 Verify Wallet on Homepage
#    [Tags]    Homepage    regression    positive
#    [Documentation]     ${11231}
#    Verify Home Page
#    Validate Wallet Section on Homepage
#    Validate Topup Wallet on Homepage
#
#C8971 Verify Pilihan Kitabisa Section
#    [Tags]    pilihan kitabisa    regression    positive
#    [Documentation]     ${8971}
#    Validate Pilihan Kitabisa Section
#    Choose Campaign from Pilihan Kitabisa
#
#C8972 Verify Lihat Semua Pilihan Kitabisa Section
#    [Tags]    pilihan kitabisa    regression    positive
#    [Documentation]     ${8972}
#    Validate Pilihan Kitabisa Section
#    Validate Lihat Semua on Pilihan Kitabisa Section
#
#C8973 Donate to Campaign on Pilihan Kitabisa Section
#    [Tags]    pilihan kitabisa    regression    positive
#    [Documentation]     ${8973}
#    Validate Pilihan Kitabisa Section
#    Choose Campaign from Pilihan Kitabisa
#    Create VA Donation  12000  vabca
#
#C8975 Donate to Campaign on Pilihan Kitabisa List
#    [Tags]    pilihan kitabisa    regression    positive
#    [Documentation]     ${8975}
#    Validate Pilihan Kitabisa Section
#    Validate Lihat Semua on Pilihan Kitabisa Section
#    Choose Campaign from Semua Pilihan Kitabisa Section
#    Create VA Donation  14000  vabca
#
### # C3742 User Add Family Members Orang Tua
### #     [Tags]      salingjaga      regression      positive
### #     [Documentation]     ${3742}
### #     Add Family Members                                              Orang Tua   ${EMPTY}    081208009303
##
### # C3743 User Add Family Members Pasangan
### #     [Tags]      salingjaga      regression      positive
### #     [Documentation]     ${3743}
### #     Add Family Members                                              Saling Jaga Sesama      Pasangan    ${EMPTY}    081208009303
##
### # C3741 User Add Family Members Anak
### #     [Tags]      salingjaga      regression      positive
### #     [Documentation]     ${3741}
### #     Add Family Members                                              Saling Jaga Sesama      Anak        ${EMPTY}    081208009303
##
### # C3744 User Add Family Members Lainnya
### #     [Tags]      salingjaga      regression      positive
### #     [Documentation]     ${3744}
### #     Add Family Members                                              Saling Jaga Sesama      Lainnya     Sepupu      081208009303
##
### # C3746 User Verify New Family Member with KTP Less Than 16 Digits
### #     [Tags]      salingjaga      regression      negative
### #     [Documentation]     ${3746}
### #     Verify New Family Member with KTP Less Than 16 Digits           3201270939293
##
### # C3747 User Verify New Family Member from Card
### #     [Tags]      salingjaga      regression      positive
### #     [Documentation]     ${3747}
### #     Verify New Family Member from Card                              ${EMPTY}
##
### # C3745 Family Members Redonate
### #     [Tags]      salingjaga      regression      positive
### #     [Documentation]     ${3745}
### #     Family Members Redonate
#
#C8746 User View Inbox Menu for Tab Pesan
#    [Tags]      inbox       regression      positive
#    [Documentation]     ${8746}
#    Cek Page Notifikasi
#
#C3754 User View Inbox Menu for Tab Berita
#    [Tags]      inbox       regression      positive
#    [Documentation]     ${3754}
#    Cek Page Update
#
#C3755 User View Update Detail
#    [Tags]      inbox       regression      positive
#    [Documentation]     ${3755}
#    Cek Detail Update with Content Inside
#
#C3756 User Can Change Account Profile
#    [Tags]      account     regression      positive
#    [Documentation]     ${3756}
#    Account Profile
#
#C3757 User Cancel Edit Profile Process
#    [Tags]      account     regression      positive
#    [Documentation]     ${3757}
#    Cancel Edit Profile Process
#
#C3758 User SUccessfully Change Account Profile
#    [Tags]      account     regression      positive
#    [Documentation]     ${3758}
#    Change Account Profile                      QA Testing      I'm a tester who tested all the feature
#
#C3759 User Set As Anonym for Donation
#    [Tags]      account     regression      positive
#    [Documentation]     ${3759}
#    Set As Anonym for Donation
#
#C3760 User Set Donation Monthly Reminder
#    [Tags]      account     regression      positive
#    [Documentation]     ${3760}
#    Set Donation Monthly Reminder
#
#C14808 User Validate Setting Page
#    [Tags]      account     regression      positive
#    [Documentation]     ${14808}
#    Validate Setting Page
#
#C14809 User Change Email/WA Account
#    [Tags]      account     regression      positive
#    [Documentation]     ${14809}
#    Verify Change Account
#
#C14812 User Change Password with Invalid Old Password
#    [Tags]      account     regression      positive        change password
#    [Documentation]     ${14812}
#    Validate Setting Page
#    Change Password with Invalid Old Password  k1t4b1s4       ${noInboxPassword}        ${noInboxPassword}
#
#C14825 User Change Password with Invalid Confirm Password
#    [Tags]      account     regression      positive        change password
#    [Documentation]     ${14825}
#    Validate Setting Page
#    Change Password with Invalid Confirm Password  ${otherPassword}  k1tab1saa  k1tab1sab
#
#C14811 User Change Password
#   [Tags]      account     regression      positive        change password
#   [Documentation]     ${14811}
#   Validate Setting Page
#   Change Password with Valid Password       ${otherPassword}     ${noInboxPassword}        ${noInboxPassword}
#   Relogin After Change Password             ${otherEmail}        ${newPassword}
#   Validate Setting Page
#   Change Password with Valid Password  ${newPassword}            k1tab1sa                  k1tab1sa
#   Relogin After Change Password        ${otherEmail}        ${otherPassword}
#
#C3719 User Validate Wallet on Account
#    [Tags]      wallet      regression      positive
#    [Documentation]     ${3719}
#    Validate Wallet on Account
#
#C3720 User Validate Pending Topup Transaction
#    [Tags]      wallet      regression      positive
#    [Documentation]     ${3720}
#    Validate Pending Topup Transaction
#
#C3718 User Cancel Topup Dompet Kebaikan
#    [Tags]      wallet      regression      positive
#    [Documentation]     ${3718}
#    Cancel Topup Dompet Kebaikan
#
#C3761 User Add Campaign to Love List
#    [Tags]      lovelist       regression      positive
#    [Documentation]     ${3761}
#    Add Campaign to Love List
#
#C3764 User View Campaign on Love List
#    [Tags]      lovelist       regression      positive
#    [Documentation]     ${3764}
#    Navigate to Favorite
#
#C3762 User Remove Campaign on Love List
#    [Tags]      lovelist       regression      positive
#    [Documentation]     ${3762}
#    Remove Campaign from List
#
#C3763 User Validate Empty Love List Page
#    [Tags]      lovelist       regression      positive
#    [Documentation]     ${3763}
#    Validate Empty Love List Page
#
#C11239 User Search Any Campaign
#    [Tags]      search      regression      positive
#    [Documentation]     ${11239}
#    Search Any Campaign         masjid
#
#C3766 User Clear Search Result
#    [Tags]      search      regression      positive
#    [Documentation]     ${3766}
#    Clear Search Result         masjid
#
#C11236 User Validate All Images on Banner
#    [Tags]      banner      regression      positive
#    [Documentation]     ${11236}
#    Validate All Images on Banner
#    Validate Banner is Clickable
#    Return to Home Page from Banner Detail
#
#C3771 User Validate Campaign List on Galang Dana Mendesak
#    [Tags]      danamendesak       regression      positive
#    [Documentation]     ${3771}
#    Validate Campaign List on Galang Dana Mendesak
#
#C3772 User Donation from Galang Dana Mendesak
#    [Tags]      danamendesak       regression      positive
#    [Documentation]     ${3772}
#    Donation from Galang Dana Mendesak          10000       vabca
#
#C3773 User Verify Kategori Favorit on Home Page
#    [Tags]      kategori favorit     regression      positive
#    [Documentation]     ${3773}
#    Validate Kategori Favorit on Home Page
#
#C8995 Click Campaign from Kategori Favorit Section
#    [Tags]    kategori favorit     regression    positive
#    [Documentation]     ${8995}
#    Choose Campaign from Kategori Favorit
#
#C8814 Change Kategori Favorit
#    [Tags]      kategori favorit     regression      positive
#    [Documentation]     ${8814}
#    Validate Change Kategori
#
#C8815 User Validate Kategori Favorit List Screen
#    [Tags]      kategori favorit     regression      positive
#    [Documentation]     ${8815}
#    Validate Kategori List Screen
#
#C3775 User Validate View Mode on Kategori Favorit
#    [Tags]      kategori favorit     regression      positive
#    [Documentation]     ${3775}
#    Validate View Mode on Kategori Favorit
#
#C8996 Lihat Semua Campaign From Kategori Favorit Section
#    [Tags]    kategori favorit     regression    positive
#    [Documentation]     ${8996}
#    Lihat Semua Campaign Kategori Favorit
#
#C8962 Create New Doa
#    [Tags]      doa     regression      positive
#    [Documentation]     ${8962}
#    Click First Campaign
#    Create Doa          10000       Dompet Kebaikan       Semoga Membantu
#
C11237 Validate Doa Section on Home Page
    [Tags]    doa     regression    positive
    [Documentation]     ${11237}
    Validate Section Doa on Home Page

C8969 Validate Lihat Semua Doa on Home Page
    [Tags]      doa     regression      positive
    [Documentation]     ${8969}
    Validate Section Doa on Home Page
    Validate Lihat Semua Doa

C8968 Validate Individual Doa
    [Tags]      doa     regression      positive
    [Documentation]     ${8968}
    Validate Section Doa on Home Page
    View First Doa

C8964 Validate Amiin Doa
    [Tags]      doa     regression      positive
    [Documentation]     ${8964}
    Validate Section Doa on Home Page
    Amiinkan Doa

C8965 Validate Share Doa
    [Tags]      doa     regression      positive
    [Documentation]     ${8965}
    Validate Section Doa on Home Page
    Share Doa

C13509 Validate Amiin Doa Lainnya
    [Tags]      doa     regression      positive
    [Documentation]     ${13509}
    Validate Section Doa on Home Page
    View First Doa
    Verify Amiinkan Doa Lainnya

C13508 Validate Lihat Doa Saya
    [Tags]      doa     regression      positive
    [Documentation]     ${13508}
    Validate Section Doa on Home Page
    View First Doa
    Verify Amiinkan Doa Lainnya
    Verify Lihat Doa saya

C8970 Change Filter Doa
    [Tags]      doa     regression      positive
    [Documentation]     ${8970}
    Validate Section Doa on Home Page
    View First Doa
    Verify Amiinkan Doa Lainnya
    Verify Sorting Doa

C8967 Delete Users Own Doa
    [Tags]      doa     regression      positive
    [Documentation]     ${8967}
    Validate Section Doa on Home Page
    View First Doa
    Verify Amiinkan Doa Lainnya
    Verify Lihat Doa saya
    Verify Delete Doa Saya

C8966 Validate Report Doa
    [Tags]      doa     regression      positive
    [Documentation]     ${8966}
    Validate Section Doa on Home Page
    Verify Laporkan Doa
#
#C13552 Validate All Sub Menu shown fine
#    [Tags]      account     regression      positive
#    [Documentation]     ${13552}
#    TestSubMenuAkun.Validate Account Page
#    Check Title in the Top is Akun
#    Check Dompet Kebaikan shown
#    Check Pengingat Donasi shown
#    Check Saya menunaikan zakat shown
#    Check Donasi rutin shown
#    Check Pengaturan shown
#    Check Bantuan shown
#    Check Tentang Kitabisa
#    Check Syarat dan ketentuan
#    Check Akuntabilitas dan Transparasi
#    Check Beri rating aplikasi Kitabisa
