# Panda Browser

Panda Browser is a simple web browser built using PyQt5 and PyQtWebEngine. It provides basic browser functionalities such as navigating back, forward, reloading, and going to the home page. The browser also includes a URL bar where users can type and visit any website.

## Features
- **Back Button**: Navigate to the previous page.
- **Forward Button**: Navigate to the next page.
- **Reload Button**: Reload the current page.
- **Home Button**: Navigate to the default homepage (Google).
- **URL Bar**: Type any URL and press enter to navigate directly to that page.

## Prerequisites
Before running this application, make sure you have the following installed:

- Python 3.x
- PyQt5
- PyQtWebEngine

You can install the required dependencies using `pip`:

```bash
pip install PyQt5 PyQtWebEngine
```

## Usage
1. Clone or download the repository.
2. Install the required dependencies.
3. Run the application using the following command:

```bash
python main.py
```

The application will open a window with a basic browser interface. By default, the homepage will be set to Google, but you can navigate to any other website by typing the URL in the address bar.

## Packaging with Inno Setup

To distribute the browser as a Windows application, you can use **Inno Setup** to create an installer. Follow these steps:

### Step 1: Install Inno Setup
You can download **Inno Setup** from the official website:

[Inno Setup Download](https://jrsoftware.org/isdl.php)

### Step 2: Package the Application
1. First, make sure the application runs correctly on your machine. After that, you need to package your Python files into a `.exe` file using a tool like **PyInstaller**.

   Install **PyInstaller** via `pip`:
   ```bash
   pip install pyinstaller
   ```

   Create the `.exe` file by running:
   ```bash
   pyinstaller --onefile --windowed main.py
   ```

   This will generate the executable file in the `dist/` folder.

2. Download and install **Inno Setup** if you haven't already.

3. Create an Inno Setup script file (`setup_script.iss`) for your installer. Here is an example script you can use to package the application:

### Example `setup_script.iss`

```ini
[Setup]
AppName=Panda Browser
AppVersion=1.0
DefaultDirName={pf}\Panda Browser
DefaultGroupName=Panda Browser
OutputDir=.\Output
OutputBaseFilename=PandaBrowserInstaller
Compression=lzma
SolidCompression=yes

[Files]
Source: "dist\main.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\Qt5WebEngineCore.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\Qt5WebEngine.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\home.html"; DestDir: "{app}\dist"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\Panda Browser"; Filename: "{app}\main.exe"
Name: "{autodesktop}\Panda Browser"; Filename: "{app}\main.exe"

[Run]
Filename: "{app}\main.exe"; Description: "Launch Panda Browser"; Flags: nowait postinstall skipifsilent
```

### Step 3: Compile the Inno Setup Script
1. Open **Inno Setup**.
2. Go to **File > Open** and select the `setup_script.iss` file.
3. Click on **Compile** (the green "Compile" button) to build the installer.

This will generate an installer in the `Output/` directory that you can use to install **Panda Browser** on Windows.

### Step 4: Distribute the Installer
After the installer is built, you can share it with users. When they run the installer, it will set up **Panda Browser** on their system.

## Code Overview
- **MainWindow Class**: This class defines the main window of the browser and its behavior. It includes functionality for the toolbar and interactions with the web browser (back, forward, reload, and home buttons).
- **QWebEngineView**: Used to render and display web pages.
- **QLineEdit**: Acts as the URL bar, allowing the user to enter a URL.
- **QAction**: Represents actions like back, forward, reload, and home that are triggered by the corresponding toolbar buttons.

## License
This project is open-source and available under the [MIT License](LICENSE).
