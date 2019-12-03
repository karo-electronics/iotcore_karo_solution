:: Copyright (c) Microsoft Corporation. All rights reserved.
:: Licensed under the MIT License.

set BATCH_HOME=%~dp0
call ..\..\..\tools\SetupBuildEnv.bat


if "%PLATFORM%"=="ARM" (

    REM i.MX6 Platforms
    echo "no imx6 platform to build"
)

if "%PLATFORM%"=="ARM64" (

    REM i.MX8M Platforms

	
	cd /d %BATCH_HOME%
	echo "Building TX8MEVK_iMX8M_Mini_1GB FFU"
	call BuildImage TX8MEVK_iMX8M_Mini_1GB TX8MEVK_iMX8M_Mini_1GB_TestOEMInput.xml
	
	
)
 
