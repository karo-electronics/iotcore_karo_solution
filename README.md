Windows 10 IoT Core for KaRo i.MX8 Computer on Modules
==============

## Board List

| SoC Type | Board Vendor | Board Name | Board Package Name|
|-----|-----|-----|-----|
|i.MX 8M Mini | KaRo | TX8M-1610 | TX8MEVK_iMX8M_Mini_1GB |


## Building the BSP

### Cloning the Repository
This repository uses submodules and should be cloned with `git clone --recurse-submodules`

### Required Tools
The following tools are required to build the driver packages and IoT Core FFU: Visual Studio 2017, Windows Kits (ADK/SDK/WDK), and the IoT Core OS Packages.

#### Visual Studio 2017
* Make sure that you **install Visual Studio 2017 before the WDK** so that the WDK can install a required plugin.
* Download [Visual Studio 2017](https://docs.microsoft.com/en-us/windows-hardware/drivers/other-wdk-downloads#step-1-install-visual-studio).
* During install select **Desktop development with C++**.
* During install select the following in the Individual components tab. If these options are not available try updating VS2017 to the latest release:
  * **VC++ 2017 version 15.9 v14.16 Libs for Spectre (ARM)**
  * **VC++ 2017 version 15.9 v14.16 Libs for Spectre (ARM64)**
  * **VC++ 2017 version 15.9 v14.16 Libs for Spectre (X86 and x64)**
  * **Visual C++ compilers and libraries for ARM**
  * **Visual C++ compilers and libraries for ARM64**

#### Windows Kits from Windows 10, version 1809
* **IMPORTANT: Make sure that any previous versions of the ADK and WDK have been uninstalled!**
* Install [ADK version 1809](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install#other-adk-downloads)
* Install [WDK version 1809](https://docs.microsoft.com/en-us/windows-hardware/drivers/other-wdk-downloads#step-2-install-the-wdk)
  * Make sure that you allow the Visual Studio Extension to install after the WDK install completes.
* If the WDK installer says it could not find the correct SDK version, install [SDK version 1809](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive)

#### IoT Core OS Packages
* Visit the [Windows IoT Core Downloads](https://www.microsoft.com/en-us/software-download/windows10IoTCore#!) page and download "Windows 10 IoT Core Packages – Windows 10 IoT Core, version 1809 (LTSC)".
* Open the iso and install ```Windows_10_IoT_Core_ARM_Packages.msi```
* Install ```Windows_10_IoT_Core_ARM64_Packages.msi``` for ARM64 builds.

### One-Time Environment Setup
Test certificates must be installed to generate driver packages on a development machine.
1. Open an Administrator Command Prompt.
2. Navigate to your newly cloned repo and into the folder `imx-iotcore\build\tools`.
3. Launch `StartBuildEnv.bat`.
4. Run `SetupCertificate.bat` to install the test certificates.
5. Make sure that submodules have been cloned. If you cloned with `--recurse-submodules` then this step won't output anything.
    ```
    git submodule init
    git submodule update
    ```

### FFU Generation

1. Launch Visual Studio 2017 as Administrator.
2. Open the solution iMXPlatform.sln (imx-iotcore\build\solution\iMXPlatform).
3. Change the build type from Debug to Release. Change the build flavor from ARM to ARM64.
4. To build press Ctrl-Shift-B or choose Build -> Build Solution from menu. This will compile all driver packages then generate the FFU.
5. Depending on the speed of the build machine FFU generation may take around 10-20 minutes.
6. After a successful build the new FFU will be located in `imx-iotcore\build\solution\iMXPlatform\Build\FFU\TX8MEVK_iMX8M_Mini_1GB` .


### Deploy the FFU
 - Follow the instructions in the [IoT Core Manufacturing Guide](https://docs.microsoft.com/en-us/windows-hardware/manufacture/iot/create-a-basic-image#span-idflashanimagespanflash-the-image-to-a-memory-card) to flash the FFU to an SD Card using the Windows IoT Core Dashboard.

### Installing to an eMMC
 - Follow the instructions in the [Booting WinPE and Flashing eMMC](Documentation/winpe-mmc.md) document.


### Adding a New Driver
 - Follow the instructions in the [Adding a New Driver](Documentation/adding-drivers.md) document.


