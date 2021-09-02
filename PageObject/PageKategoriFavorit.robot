*** Settings ***
Library     AppiumLibrary       timeout=60
Resource    ../Utils/scrollpage.robot

*** Variable ***
${kategpriFavoritContainer}     xpath=//*[@resource-id="com.kitabisa.android.staging:id/scrollView"]
${menuGridListOption}           id=com.kitabisa.android.staging:id/menuGrid
${bencanaAlam}                  xpath=//*[@text="Bencana Alam"]
${hewanLingkungan}              xpath=//*[@text="Hewan & Lingkungan"]
${bantuanMedisKategori}         xpath=//*[@text="Bantuan Medis & Kesehatan"]
${balitaAnakSakit}              xpath=//*[@text="Balita & Anak Sakit"]
${kategoriListContainer}        xpath=(//*[@resource-id="com.kitabisa.android.staging:id/imageView"])[1]
${kategoriButton}               id=com.kitabisa.android.staging:id/buttonCategory
${sortButton}                   id=com.kitabisa.android.staging:id/buttonSort
${sortPalingMendesak}           xpath=//*[@text="Paling Mendesak"]
${sortPalingSesuai}             xpath=//*[@text="Paling Sesuai"]
${sortTerbaru}                  xpath=//*[@text="Terbaru"]
${sortDanaPalingSedikit}        xpath=//*[@text="Terkumpul Dana Paling Sedikit"]
${filterButton}                 id=com.kitabisa.android.staging:id/buttonFilter
${filterOlehKitabisa}           xpath=//*[@text="Oleh Kitabisa"]
${filterOlehYayasan}            xpath=//*[@text="Digalang oleh Yayasan"]
${filterOlehPublik}             xpath=//*[@text="Digalang oleh Publik"]
${applyFilterButton}            id=com.kitabisa.android.staging:id/buttonApply
${btnChangeKategori}            id=com.kitabisa.android.staging:id/textViewChange
${clearKategoriFavorit}         //*[contains(@resource-id,"imageViewMinus")]
${btnSaveKategori}              id=com.kitabisa.android.staging:id/textViewSave

*** Keywords ***
Verify Kategori Favorit Screen
    wait until page contains element    ${kategpriFavoritContainer}
    element should be visible           ${menuGridListOption}

Verify Kategori Campaign List
    wait until page contains element    ${kategoriListContainer}

Verify Option Sort
    wait until element is visible       ${sortPalingMendesak}
    element should be visible           ${sortPalingSesuai}
    element should be visible           ${sortTerbaru}
    element should be visible           ${sortDanaPalingSedikit}

Verify Option Filter
    wait until element is visible       ${filterolehkitabisa}
    element should be visible           ${filterolehyayasan}
    element should be visible           ${filterOlehPublik}

Change Kategori View Mode
    click element                       ${menuGridListOption}
    wait until page contains element    ${kategpriFavoritContainer}

Click on Bencana Alam
    wait until element is visible       ${bencanaAlam}
    click element                       ${bencanaAlam}

Click on Hewan Lingkungan
    click element                       ${hewanLingkungan}

Click Kategori Button
    click element                       ${kategoributton}

Click Urutkan Button
    click element                       ${sortbutton}

Click Filter Button
    click element                       ${filterbutton}

Click Paling Sesuai Sort
    click element                       ${sortPalingSesuai}

Click Oleh Publik Filter
    click element                       ${filterolehpublik}

Click Terapkan Filter
    wait until element is visible       ${applyfilterbutton}
    click element                       ${applyfilterbutton}

Click Ubah Favorit Kamu
    wait until page contains element    ${btnChangeKategori}
    click element                       ${btnChangeKategori}
    repeat keyword  3 times             Click Element                       ${clearKategoriFavorit}
    long scrolling down                 ${kategpriFavoritContainer}         1
    click element                       ${BantuanMedisKategori}
    click element                       ${hewanLingkungan}
    click element                       ${balitaAnakSakit}
    scroll up to element                ${btnSaveKategori}                  ${kategpriFavoritContainer}
    click element                       ${btnSaveKategori}
