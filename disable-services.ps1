#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.

$services = @(
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "dmwappushservice"                         # WAP Push Message Routing Service (see known issues)
    "HomeGroupListener"                        # HomeGroup Listener
    "HomeGroupProvider"                        # HomeGroup Provider
    "lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Downloaded Maps Manager
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "TrkWks"                                   # Distributed Link Tracking Client
    "WbioSrvc"                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    #"WlanSvc"                                 # WLAN AutoConfig
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    "wscsvc"                                   # Windows Security Center Service
    "WSearch"                                 # Windows Search
    "XblAuthManager"                           # Xbox Live Auth Manager
    "XblGameSave"                              # Xbox Live Game Save Service
    "XboxNetApiSvc"                            # Xbox Live Networking Service
    "ndu"                                      # Windows Network Data Usage Monitor
    # Services which cannot be disabled
    "WdNisSvc"
    "SSDPSRV"
    "lfsvc"
    "AXInstSV"
    "AJRouter"
    "AppReadiness"
    "HomeGroupListener"
    "HomeGroupProvider"
    "SharedAccess"
    "lltdsvc"
    "diagnosticshub.standardcollector.service"
    "wlidsvc"
    "SmsRouter"
    "NcdAutoSetup"
    "PNRPsvc"
    "p2psvc"
    "p2pimsvc"
    "PNRPAutoReg"
    "WalletService"
    "WMPNetworkSvc"
    "icssvc"
    "XblAuthManager"
    "XblGameSave"
    "XboxNetApiSvc"
    "DmEnrollmentSvc"
    "RetailDemo"
)
foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}
