*** Settings ***
Library        AppiumLibrary

*** Variables ***
${campaignPilihanSection}       xpath=//*[@text="Pilihan Kitabisa"]/following-sibling::*[@resource-id="com.kitabisa.android.staging:id/recyclerView"]
${firstPilihanCampaign}         xpath=//*[@text="Pilihan Kitabisa"]/following-sibling::androidx.recyclerview.widget.RecyclerView/androidx.cardview.widget.CardView[1]/                                                                                       
${pilihanlihatLainnyaBtn}       id=com.kitabisa.android.staging:id/textViewSectionSeeAll
${pilihanLihatSemuaBtn}         id=com.kitabisa.android.staging:id/textViewSeeMore


*** Keywords ***
# Verify Pilihan Kitabisa Section
#     scroll down to element              ${campaignPilihanSection}        ${homepagecontainer}
#     element should be visible           ${campaignPilihanSection}
#     element should be visible           ${pilihanlihatLainnyaBtn}
#     element should be visible           ${pilihanlihatSemuaBtn}

# Choose Campaign from Pilihan Kitabisa
#     scroll down to element              ${campaignPilihanSection}        ${homepagecontainer}
#     click element                       ${firstPilihanCampaign}

