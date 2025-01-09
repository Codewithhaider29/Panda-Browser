; Inno Setup Script for Panda Browser

[Setup]
AppName=Panda Browser
AppVersion=1.0
DefaultDirName={pf}\Panda Browser
DefaultGroupName=Panda Browser
OutputBaseFilename=PandaBrowserInstaller
Compression=lzma
SolidCompression=yes

[Files]
; Add your main executable file
Source: "dist\browser.exe"; DestDir: "{app}"; Flags: ignoreversion

; Include the icon file in the installation
Source: "dist\logo.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Create shortcuts for the main executable
Name: "{group}\Panda Browser"; Filename: "{app}\browser.exe"; IconFilename: "{app}\logo.ico"
Name: "{commondesktop}\Panda Browser"; Filename: "{app}\browser.exe"; IconFilename: "{app}\logo.ico"

[Run]
; Run the application after installation (optional)
Filename: "{app}\browser.exe"; Description: "Launch Panda Browser"; Flags: nowait postinstall skipifsilent
