*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../PageObject/PageHome.robot
Resource    ../PageObject/PagePaymentMethod.robot

*** Keywords ***
Validate Pilihan Kitabisa Section
    Verify Pilihan Kitabisa Section

Choose Campaign from Pilihan Kitabisa Section
    Choose Campaign from Pilihan Kitabisa

Validate Lihat Semua on Pilihan Kitabisa Section
    View All Pilihan Kitabisa

Choose Campaign from Semua Pilihan Kitabisa Section
    Choose Campaign From Lihat Semua Pilihan Kitabisa
