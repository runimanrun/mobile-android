*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PageKategoriFavorit.robot

*** Keywords ***
Validate Campaign List on Kategori Favorit
    Verify Kategori Favorit Section
    Verify Campaign List Kategori Favorit

Choose Campaign from Kategori Favorit
    Verify Kategori Favorit Section
    Verify Campaign from Kategori Favorit Section

Lihat Semua Campaign Kategori Favorit
    Verify Kategori Favorit Section
    Verify Lihat Semua Campaign Favorit

Validate Kategori Favorit on Home Page
    Verify Kategori Favorit Section

Validate View Mode on Kategori Favorit
    Validate Kategori Favorit on Home Page
    Click Favorit Kategori Lainnya
    Verify Kategori Favorit Screen
    Change Kategori View Mode

Validate Kategori List Screen
    Validate Kategori Favorit on Home Page
    Click Favorit Kategori Lainnya
    Verify Kategori Favorit Screen
    Click on Hewan Lingkungan
    Verify Kategori Campaign List
    Click Kategori Button
    Verify Kategori Favorit Screen
    Click on Hewan Lingkungan
    Verify Kategori Campaign List
    Click Urutkan Button
    Verify Option Sort
    Click Paling Sesuai Sort
    Verify Kategori Campaign List
    Click Filter Button
    Verify Option Filter
    Click Oleh Publik Filter
    Click Terapkan Filter
    Verify Kategori Campaign List

Validate Change Kategori
    Validate Kategori Favorit on Home Page
    Click Favorit Kategori Lainnya
    Verify Kategori Favorit Screen
    Click Ubah Favorit Kamu
