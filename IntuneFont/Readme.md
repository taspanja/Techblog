# Deploy fonts to Intune managed Windows 10 devices

To deploy multiple fonts using this new script you need to create a txt file name fontlist.txt and input the list of fonts that will be installed via intune.

Then you can follow same instructions found on Nicolonsky's site https://tech.nicolonsky.ch/deploy-fonts-with-intune/ but change the install command and uninstall command to the following

Install command: powershell -Ex Bypass -windowstyle Hidden -file "InstallFont.ps1" "fontlist.txt"
Unnstall command: powershell -Ex Bypass -windowstyle Hidden -file "UninstallFont.ps1" "fontlist.txt"

Also remember to add the fonts, the txt file and the UninstallFont.intunewin to the dependencies of the app when deploying
