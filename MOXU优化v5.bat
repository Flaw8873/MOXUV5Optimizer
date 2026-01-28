@echo off
title HWID验证工具
color 0A
setlocal enabledelayedexpansion

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
)
if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"

:menu
cls
title MOXU优化v5
color 6
echo.
echo ======================================================
echo         MOXU优化v5  release20260119
echo         System Performance Optimizer
echo ======================================================
echo ┌──────────────────────────────┐
echo │ 更新公告:                    │ 
echo │       1.对各模式进行细微调整 │
echo │       2.添加新ui             │
echo └──────────────────────────────┘
echo.
echo ┌─────────────────────┬──────────────────────┬──────────────────────┐
echo │                     │                      │                      │
echo │  HWID验证           │  网络优化            │  系统优化            │
echo │  ───────────        │  ───────────         │  ───────────         │
echo │  [已授权]           │  1.normal模式        │  1.性能优化          │
echo │  V5用户             │  2.best模式          │  2.恢复默认          │
echo │                     │  3.fast模式          │                      │
echo │                     │  4.恢复网络          │                      │
echo │                     │                      │                      │
echo └─────────────────────┴──────────────────────┴──────────────────────┘
echo.

echo 请选择要执行的操作:
echo [1] 网络优化    [2] 系统优化    [3] 退出程序
echo.
set /p choice=请输入选项(1-3):

if "%choice%"=="1" goto optimize
if "%choice%"=="2" goto system
if "%choice%"=="3" (
    color 0A
    echo.
    echo 感谢使用 MOXU优化v5 ultra
    echo 程序将在3秒后退出...
    timeout /t 3 /nobreak >nul
    exit /b 0
)

:: 无效选择处理
color 4F
echo.
echo ╔════════════════════════════════════════╗
echo ║       错误：无效的选项！               ║
echo ║       请输入正确数字                   ║
echo ╚════════════════════════════════════════╝
ping -n 2 127.0.0.1 >nul
goto menu

:optimize
cls
color 0B
echo.
echo          ╔══════════════════════════════════════════════════╗
echo          ║              网络优化模块                        ║
echo          ║          Network Optimization                    ║
echo          ╚══════════════════════════════════════════════════╝
echo.
echo ┌─────────────────────────────────────────────────────────┐
echo │                                                         │
echo │  请选择网络优化模式：                                   │
echo │                                                         │
echo │  [1] normal模式 - 平衡性能与稳定                        │
echo │  [2] best模式 - 低延迟优化                              │
echo │  [3] fast模式 - 游戏高响应                              │
echo │  [4] 恢复网络设置                                       │
echo │  [0] 返回主菜单                                         │
echo │                                                         │
echo │   注意：切换模式请先恢复                                │
echo │                                                         │
echo └─────────────────────────────────────────────────────────┘
echo.
set /p choice=请输入选项(0-4):

if "%choice%"=="1" goto office
if "%choice%"=="2" goto bestkb
if "%choice%"=="3" goto fastreg
if "%choice%"=="4" goto 全部恢复
if "%choice%"=="0" goto menu

color 4F
echo.
echo ╔════════════════════════════════════════╗
echo ║       错误：无效的选项！               ║
echo ║       请输入正确数字                   ║
echo ╚════════════════════════════════════════╝
ping -n 2 127.0.0.1 >nul
goto optimize

:office
echo 正在设置normal模式优化...
color 0B
echo.
echo          ╔══════════════════════════════════╗
echo          ║      优化进行中...               ║
echo          ║   请勿关闭窗口                   ║
echo          ╚══════════════════════════════════╝
netsh int tcp set global autotuninglevel=normal >null 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v EnableActiveProbing /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Afd\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d 256960 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Afd\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d 256960 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TcpWindowSize /t REG_DWORD /d 65535 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v DefaultTTL /t REG_DWORD /d 64 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v GlobalMaxTcpWindowSize /t REG_DWORD /d 256960 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TcpFrequency /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65535 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableThrottle" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableRSS" /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetworkThrottlingIndex /d 0 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TCPNoDelay /t REG_DWORD /d 1 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v LatencyMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 3 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v LatencyMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TcDODownloadModepip\PaDODownloadModerameters" /v "KeepAliveTime" /t REG_DWORD /d 72000000 /f >null
netsh interface tc set global rss=enabled  /f >null
netsh int tcp set global timestamps=enabled  /f >null
netsh int tcp set global autotuninglevel=experimental /f >null
netsh int tcp set global ecncapability=disabled /f >null
netsh interface teredo set state type=default /f >null
netsh interface isatap set state enabled  /f >null
netsh interface 6to4 set state enabled /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v MTU /t REG_DWORD /d 1500 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 1 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v Tcp1323Opts /t REG_DWORD /d 3 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v SackOpts /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 10 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Psched\Parameters" /v NonBestEffortLimit /t REG_DWORD /d 10 /f >null
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v TimerResolution /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\BackgroundTransfer" /v EnableBackgroundTransfer /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v LatencySensitive /t REG_DWORD /d 1 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v LatencySensitive /t REG_SZ /d High /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t REG_DWORD /d 1500 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v ProcessorAffinityMask /t REG_DWORD /d 256 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v DisableRSS /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxHashTableSize /t REG_DWORD /d 65536 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v MaxFreeTcbs /t REG_DWORD /d 16000 /f >null
netsh int tcp set global initialRto=1000 >null 2>&1
ipconfig /release >null 2>&1
ipconfig /renew >null 2>&1
ipconfig /flushdns >null 2>&1
netsh int ip reset resetlog.txt >null 2>&1
netsh winsock reset >null 2>&1
color 0B
echo.
echo ┌─────────────────────────────────────────────┐
echo │   优化完成！等待10秒即可游玩                │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto optimize

:bestkb
echo 正在设置best模式优化...
color 0B
echo.
echo          ╔══════════════════════════════════╗
echo          ║      优化进行中...               ║
echo          ║   请勿关闭窗口                   ║
echo          ╚══════════════════════════════════╝
netsh int tcp set global autotuninglevel=normal >null 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v DisableWriteCacheBufferFlushing /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v EnableWriteCache /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v DisableBandwidthThrottling /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v Size /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v *PriorityVLANTag /t REG_SZ /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableTCPA /t REG_SZ /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpFastOpen /t REG_DWORD /d 3 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TCPNoDelay /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TcpAckFrequency /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v EnableActiveProbing /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Afd\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d 256960 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Afd\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d 256960 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TcpWindowSize /t REG_DWORD /d 65535 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v DefaultTTL /t REG_DWORD /d 64 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v GlobalMaxTcpWindowSize /t REG_DWORD /d 16777216 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TcpFrequency /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65535 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableThrottle" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableRSS" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableRSC" /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetworkThrottlingIndex /d 0 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TCPNoDelay /t REG_DWORD /d 1 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v LatencyMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 3 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d 15 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v LatencyMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TcDODownloadModepip\PaDODownloadModerameters" /v "KeepAliveTime" /t REG_DWORD /d 72000000 /f >null
netsh interface tc set global rss=enabled  /f >null
netsh int tcp set global timestamps=enabled  /f >null
netsh int tcp set global ecncapability=disabled /f >null
netsh interface teredo set state type=default /f >null
netsh interface isatap set state enabled  /f >null
netsh interface 6to4 set state enabled /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v MTU /t REG_DWORD /d 1500 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 1 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v Tcp1323Opts /t REG_DWORD /d 3 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v SackOpts /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Psched\Parameters" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v TimerResolution /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\BackgroundTransfer" /v EnableBackgroundTransfer /t REG_DWORD /d 0 /f >null
netsh int tcp set global initialRto=1000 >null 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /d ffffffff /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetworkThrottlingIndex /d ffffffff /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl /v IRQ8Priority /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsMemoryUsage /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SystemPages /t REG_DWORD /d 4294967295 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v LatencySensitive /t REG_DWORD /d 1 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v LatencySensitive /t REG_SZ /d High /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t REG_DWORD /d 1500 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v ProcessorAffinityMask /t REG_DWORD /d 256 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v DisableRSS /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxHashTableSize /t REG_DWORD /d 65536 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v MaxFreeTcbs /t REG_DWORD /d 16000 /f >null
ipconfig /release >null 2>&1
ipconfig /renew >null 2>&1
ipconfig /flushdns >null 2>&1
color 0B
echo.
echo ┌─────────────────────────────────────────────┐
echo │   优化完成！等待10秒即可游玩                │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto optimize

:fastreg
echo 正在设置fast模式优化...
color 0B
echo.
echo          ╔══════════════════════════════════╗
echo          ║      优化进行中...               ║
echo          ║   请勿关闭窗口                   ║
echo          ╚══════════════════════════════════╝
netsh int tcp set global autotuninglevel=normal >null 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v DisableWriteCacheBufferFlushing /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v EnableWriteCache /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v DisableBandwidthThrottling /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v Size /t REG_DWORD /d 3 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v *PriorityVLANTag /t REG_SZ /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableTCPA /t REG_SZ /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpFastOpen /t REG_DWORD /d 3 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TCPNoDelay /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TcpAckFrequency /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v EnableActiveProbing /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Afd\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d 256960 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Afd\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d 256960 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TcpWindowSize /t REG_DWORD /d 64240 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v DefaultTTL /t REG_DWORD /d 64 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v GlobalMaxTcpWindowSize /t REG_DWORD /d 16777216 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TcpFrequency /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65535 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableThrottle" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableRSS" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableRSC" /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetworkThrottlingIndex /d 0 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TCPNoDelay /t REG_DWORD /d 1 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v LatencyMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 3 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d 15 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v LatencyMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TcDODownloadModepip\PaDODownloadModerameters" /v "KeepAliveTime" /t REG_DWORD /d 72000000 /f >null
netsh int tcp set global autotuninglevel=normal /f >null
netsh int tcp set global rss=enabled /f >null
netsh int tcp set global timestamps=enabled  /f >null
netsh int tcp set global ecncapability=disabled /f >null
netsh int tcp set global dca=enabled /f >null
netsh int tcp set global netdma=enabled /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v MTU /t REG_DWORD /d 1500 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 1 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v Tcp1323Opts /t REG_DWORD /d 3 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v SackOpts /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Psched\Parameters" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v TimerResolution /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\BackgroundTransfer" /v EnableBackgroundTransfer /t REG_DWORD /d 0 /f >null
netsh int tcp set global initialRto=1000 >null 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /d ffffffff /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetworkThrottlingIndex /d ffffffff /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl /v IRQ8Priority /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsMemoryUsage /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SystemPages /t REG_DWORD /d 4294967295 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v PnPCapabilities /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v *PowerSaveMode /t REG_SZ /d Off /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v *EnergyEfficient /t REG_SZ /d Off /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d245a" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Disk" /v TimeOutValue /t REG_DWORD /d 10 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Disk" /v DisableDeleteNotification /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v DefaultReceiveThrottle /t REG_DWORD /d 2 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v LatencySensitive /t REG_DWORD /d 1 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v LatencySensitive /t REG_SZ /d High /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation" /v DisableLargeMtu /t REG_DWORD /d 1 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v Enable /t REG_SZ /d N /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisableCompression /t REG_DWORD /d 1 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d Low /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t REG_DWORD /d 1500 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v ProcessorAffinityMask /t REG_DWORD /d 256 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v DisableRSS /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxHashTableSize /t REG_DWORD /d 65536 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v MaxFreeTcbs /t REG_DWORD /d 16000 /f >null
ipconfig /release >null 2>&1
ipconfig /renew >null 2>&1
ipconfig /flushdns >null 2>&1
color 0B
echo.
echo ┌─────────────────────────────────────────────┐
echo │   优化完成！等待10秒即可游玩                │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto optimize


:system
cls
color 0D
echo.
echo          ╔══════════════════════════════════════════════════╗
echo          ║              系统优化模块                        ║
echo          ║          System Optimization                     ║
echo          ╚══════════════════════════════════════════════════╝
echo.
echo ┌─────────────────────────────────────────────────────────┐
echo │                                                         │
echo │  请选择系统优化操作：                                   │
echo │                                                         │
echo │  [1] 性能优化 - 最大化系统性能                          │
echo │  [2] 恢复默认 - 恢复系统原始设置                        │
echo │  [0] 返回主菜单                                         │
echo │                                                         │
echo │  注意：请根据您的硬件选择对应选项                       │
echo │                                                         │
echo └─────────────────────────────────────────────────────────┘
echo.
set /p choice=请输入选项(0-2):

if "%choice%"=="1" goto systemoptimize
if "%choice%"=="2" goto systemoff
if "%choice%"=="0" goto menu

color 4F
echo.
echo ╔════════════════════════════════════════╗
echo ║       错误：无效的选项！               ║
echo ║       请输入正确数字                   ║
echo ╚════════════════════════════════════════╝
ping -n 2 127.0.0.1 >nul
goto system

:systemoptimize
echo 正在设置系统优化...
color 0D
echo.
echo          ╔══════════════════════════════════╗
echo          ║      优化进行中...               ║
echo          ║   请勿关闭窗口                   ║
echo          ╚══════════════════════════════════╝
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >null
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers /v HwSchMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t REG_DWORD /d 1024 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IoPriority" /t REG_DWORD /d 7 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 4194304 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableQuantum" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableMMCO" /t REG_DWORD /d 0 /f >null
reg add HKEY_CURRENT_USER\System\GameConfigStore /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v AffinityPolicy /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IntcAzAudAddService\SysPrep" /v GroupPolicy /t REG_DWORD /d 1 /f >null

echo 请选择你的显卡型号:
echo 1.NVIDIA
echo 2.AMD
set /p choice=请输入选项(1-2):

if "%choice%"=="1" goto one
if "%choice%"=="2" goto two

echo 无效选项，请重新输入
pause
goto menu

:one
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "PowerManagementMode" /t REG_SZ /d "Prefer maximum performance" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "TextureFilteringQuality" /t REG_SZ /d "High performance" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "MaxPrerenderedFrames" /t REG_DWORD /d "1" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global" /v "PreferredOpenGPVendor" /t REG_SZ /d "NVIDIA" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global" /v "ShimRendererMode" /t REG_DWORD /d "0x00000010" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PerfLevelSrc" /t REG_DWORD /d "0x00002222" /f >null

echo 请选择你的cpu型号:
echo 1.intel
echo 2.AMD
set /p choice=请输入选项(1-2):

if "%choice%"=="1" goto onee
if "%choice%"=="2" goto twoo

echo 无效选项，请重新输入
pause
goto menu

:onee
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cc5b647c-8e4e-4a04-8576-5ba06b9b0fa0" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PerfPowerModeEnable /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v EnableUlps /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v TdrLevel /t REG_DWORD /d 3 /f >null
color 0D
echo.
echo ┌─────────────────────────────────────────────┐
echo │   优化完成！等待10秒即可游玩                │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto system

:two
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_PhmSoftPowerPlayTable" /t REG_DWORD /d "0" /f >null
reg add "HKEY_CURRENT_USER\Software\AMD\Settings" /v "PowerManagementMode" /t REG_SZ /d "High performance" /f >null
reg add "HKEY_CURRENT_USER\Software\AMD\Settings" /v "TextureFilteringQuality" /t REG_SZ /d "Performance" /f >null
reg add "HKEY_CURRENT_USER\Software\AMD\Settings" /v "MaxPrerenderedFrames" /t REG_DWORD /d "0" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDRyzenMasterDriverV13" /v "Start" /t REG_DWORD /d "4" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ShaderCache" /t REG_DWORD /d "32" /f >null

echo 请选择你的cpu型号:
echo 1.intel
echo 2.AMD
set /p choice=请输入选项(1-2):

if "%choice%"=="1" goto onee
if "%choice%"=="2" goto twoo

echo 无效选项，请重新输入
pause
goto system

:twoo
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687a9e-e3a5-4dbf-b1dc-15eb381c6863" /v Attributes /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v CpuPriority /t REG_DWORD /d 6 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DisableTsx /t REG_DWORD /d 1 /f >null
color 0D
echo.
echo ┌─────────────────────────────────────────────┐
echo │   优化完成！等待10秒即可游玩                │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto system

:systemoff
echo 正在恢复系统设置...
color 0D
echo.
echo          ╔══════════════════════════════════╗
echo          ║      恢复进行中...               ║
echo          ║   请勿关闭窗口                   ║
echo          ╚══════════════════════════════════╝
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 1 /f >null
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers /v HwSchMode /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableMMCO" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t REG_DWORD /d 256 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IoPriority /t REG_DWORD /d 3 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableQuantum" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 0 /f >null
reg add HKEY_CURRENT_USER\System\GameConfigStore /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 3 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 1 /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v AffinityPolicy /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\IntcAzAudAddService\SysPrep" /v GroupPolicy /f >null

echo 请选择你的显卡型号:
echo 1.NVIDIA
echo 2.AMD
set /p choice=请输入选项(1-2):

if "%choice%"=="1" goto oneoff
if "%choice%"=="2" goto twooff

echo 无效选项，请重新输入
pause
goto system

:oneoff
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global" /v "PreferredOpenGPVendor" /t REG_SZ /d "删除" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global" /v "ShimRendererMode" /t REG_DWORD /d "0x00000000" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PerfLevelSrc" /t REG_DWORD /d "0x00003333" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "PowerManagementMode" /t REG_SZ /d "Adaptive" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "TextureFilteringQuality" /t REG_SZ /d "Quality" /f >null
reg add "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v "MaxPrerenderedFrames" /t REG_DWORD /d "3" /f >null

echo 请选择你的cpu型号:
echo 1.intel
echo 2.AMD
set /p choice=请输入选项(1-2):

if "%choice%"=="1" goto oneeoff
if "%choice%"=="2" goto twoooff

echo 无效选项，请重新输入
pause
goto system

:twooff
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "2" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDRyzenMasterDriverV13" /v "Start" /t REG_DWORD /d "1" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "0" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ShaderCache" /t REG_DWORD /d "0" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "1" /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_PhmSoftPowerPlayTable" /t REG_DWORD /d "0" /f >null
reg add "HKEY_CURRENT_USER\Software\AMD\Settings" /v "TextureFiltering" /t REG_SZ /d "Quality" /f >null
reg add "HKEY_CURRENT_USER\Software\AMD\Settings" /v VSync /t REG_DWORD /d 1 /f >null

echo 请选择你的cpu型号:
echo 1.intel
echo 2.AMD
set /p choice=请输入选项(1-2):

if "%choice%"=="1" goto oneeoff
if "%choice%"=="2" goto twoooff

echo 无效选项，请重新输入
pause
goto system

:oneeoff
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cc5b647c-8e4e-4a04-8576-5ba06b9b0fa0" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PerfPowerModeEnable /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v EnableUlps /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v TdrLevel /t REG_DWORD /d 3 /f >null
color 0D
echo.
echo ┌─────────────────────────────────────────────┐
echo │   恢复完成！重启电脑即可恢复                │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto system

:twoooff
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687a9e-e3a5-4dbf-b1dc-15eb381c6863" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v CpuPriority /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DisableTsx /t REG_DWORD /d 0 /f >null
color 0D
echo.
echo ┌─────────────────────────────────────────────┐
echo │   恢复完成！重启电脑即可恢复                │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto system

:全部恢复
echo 正在恢复网络...
color 0B
echo.
echo          ╔══════════════════════════════════╗
echo          ║      恢复进行中...               ║
echo          ║   请勿关闭窗口                   ║
echo          ╚══════════════════════════════════╝
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d245a" /v Attributes /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Disk" /v DisableDeleteNotification /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 8 /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 6 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Disk" /v TimeOutValue /t REG_DWORD /d 60 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v PnPCapabilities /t REG_DWORD /d 24 /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v *PowerSaveMode /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v *EnergyEfficient /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v DisableWriteCacheBufferFlushing /t REG_DWORD /d 0 /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v EnableWriteCache /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsMemoryUsage /t REG_DWORD /d 2 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v DisableBandwidthThrottling /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v Size /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SystemPages /t REG_DWORD /d 0 /f >null
reg delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl /v IRQ8Priority /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpFastOpen /t REG_DWORD /d 0 /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableTCPA /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v *PriorityVLANTag /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TCPNoDelay /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v TcpAckFrequency /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v EnableActiveProbing /t REG_DWORD /d 1 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableTCPChimney" /t REG_DWORD /d 0 /f >null
reg delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TcpWindowSize /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f >null
reg add HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /v SackOpts /t REG_DWORD /d 1 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v DefaultTTL /t REG_DWORD /d 128 /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Tcp1323Opts /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableRSS /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableRSC" /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 5000 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 1 /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v DefaultReceiveWindow /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v DefaultSendWindow /f >null
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v TimerResolution /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /f >null
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f >null
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\BackgroundTransfer" /v EnableBackgroundTransfer /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v MTU /t REG_DWORD /d 1500 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc" /v Start /t REG_DWORD /d 3 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lltdsvc" /v Start /t REG_SZ /d "3" /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheTtl /t REG_DWORD /d 86400 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxNegativeCacheTtl /t REG_DWORD /d 900 /f >null
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TCPNoDelay /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 5 /f >null
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" /t REG_DWORD /d 1 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v LatencyMode /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetworkThrottlingIndex /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v DefaultReceiveThrottle /t REG_DWORD /d 2 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v LatencySensitive /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v LatencySensitive /t REG_SZ /d Medium /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 0 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation" /v DisableLargeMtu /t REG_DWORD /d 0 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v Enable /t REG_SZ /d Y /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 1 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisableCompression /t REG_DWORD /d 1 /f >null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Scheduling_Category /t REG_SZ /d High /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t REG_DWORD /d 1024 /f >null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v ProcessorAffinityMask /t REG_DWORD /d 0 /f >null
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v DisableRSS /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 0 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxHashTableSize /t REG_DWORD /d 512 /f >null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v MaxFreeTcbs /t REG_DWORD /d 2000 /f >null
netsh int tcp reset /f >null
netsh int ip reset >null 2>&1
ipconfig /release >null 2>&1
ipconfig /renew >null 2>&1
ipconfig /flushdns >null 2>&1
color 0B
echo.
echo ┌─────────────────────────────────────────────┐
echo │   优化完成！感谢使用MOXU优化！              │
echo └─────────────────────────────────────────────┘
ping -n 3 127.0.0.1 >nul
goto optimize