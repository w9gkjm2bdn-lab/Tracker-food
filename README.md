# MyFitPal UK - Fixed Scanner Final

Changes:
- Scanner now uses html5-qrcode 2.3.8 (works on iPhone Safari + Android)
- Scans EAN-13, EAN-8, UPC-A, UPC-E, CODE-128
- On scan -> fetches https://uk.openfoodfacts.org/api/v0/product/{barcode}.json
- Unified search box: "Asda skimmed milk" OR barcode number OR camera

Deploy:
1. Upload all files to GitHub repo root (replace existing)
2. Settings > Pages > Deploy from branch > main / root
3. Live at https://USERNAME.github.io/myfitpal/

Test barcodes:
- 5000157023425 (Tesco)
- 5054070100152 (Grenade bar)
