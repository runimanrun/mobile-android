*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageAccount.robot

*** Keywords ***
Validate Account Page
    Go To Account
    Verify Account Page

Check Title in the Top is Akun
    Title in the Top is Akun

Check Dompet Kebaikan shown
    Verify text Dompet Kebaikan
    Verify Last Wallet Transaction

Check Pengingat Donasi shown
   Verify Reminder Donation

Check Saya menunaikan zakat shown
   Verify Saya menunaikan zakat

Check Donasi rutin shown
   Verify donasi rutin

Check Pengaturan shown
   Verify Settings

Check Bantuan shown
   Verify Help

Check Tentang Kitabisa
   Verify tentang kitabisa

Check Syarat dan ketentuan
   Verify Term and Conditions

Check Akuntabilitas dan Transparasi
   Verify akuntabiitas dan transparasi

Check Beri rating aplikasi Kitabisa
   Verify beri rating applikasi