@echo off
cd vs2022 && ^
sed -i "s MultiThreaded< MultiThreadedDLL< " ^
    bin2coff.vcxproj ^
    chm.vcxproj ^
    enginedump.vcxproj ^
    engines.vcxproj ^
    libdjvu.vcxproj ^
    libmupdf.vcxproj ^
    logview.vcxproj ^
    MakeLZSA.vcxproj ^
    mupdf-libs.vcxproj ^
    mupdf.vcxproj ^
    PdfFilter.vcxproj ^
    PdfPreview.vcxproj ^
    PdfPreviewTest.vcxproj ^
    plugin-test.vcxproj ^
    signfile.vcxproj ^
    sizer.vcxproj ^
    SumatraPDF.vcxproj ^
    SumatraPDF-dll.vcxproj ^
    test_util.vcxproj ^
    unarrlib.vcxproj ^
    utils.vcxproj && ^
cd .. && ^
msbuild vs2022\SumatraPDF.vcxproj -p:Configuration=Release;Platform=x64 && ^
mklink /H "%LIBRARY_BIN%\SumatraPDF.exe" out\rel64\SumatraPDF.exe && ^
mklink /H "%LIBRARY_PREFIX%\etc\SumatraPDF-settings.txt" ^
    "%RECIPE_DIR%\SumatraPDF-settings.txt"
