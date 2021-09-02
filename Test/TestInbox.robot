*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageInbox.robot
Resource    ../PageObject/PageHome.robot

*** Keywords ***
Goto Inbox and Verify Tab Inboxes are Showing
    Go To Inbox
    Verify Tab Inboxes are Showing

Cek Page Notifikasi
    Goto Inbox and Verify Tab Inboxes are Showing
    Verify Tab Pesan is Clickable
    Verify the First Content of Notification is Showing

Cek Page Update
    Goto Inbox and Verify Tab Inboxes are Showing
    Verify Tab Berita is Clickable
    Verify the First Content Of Update is Showing Properly
    Verify load more content update is working

Cek Detail Update with Content Inside
    Goto Inbox and Verify Tab Inboxes are Showing
    Click First Update
    Verify the Detail Update Showing Properly
    Verify Lihat Semua on Kabar Terbaru is Clickable
    Verify Lihat Semua on History Donation is Clickable
    Verify Fundraiser Section is Clickable

Cek Empty Berita Page
    Goto Inbox and Verify Tab Inboxes are Showing
    Verify Tab Berita is Clickable
    Verify Empty Berita

Cek Empty Pesan Page
    Goto Inbox and Verify Tab Inboxes are Showing
    Verify Tab Pesan is Clickable
    Verify Empty Pesan

Click Button Donate From Inbox
    Verify Button Donate
    Verify Home Page
