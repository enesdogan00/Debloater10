$Bloatware = @(

    #3rd party
    "2414FC7A.Viber"
    "41038Axilesoft.ACGMediaPlayer"
    "46928bounde.EclipseManager"
    "4DF9E0F8.Netflix"
    "64885BlueEdge.OneCalendar"
    "7EE7776C.LinkedInforWindows"
    "828B5831.HiddenCityMysteryofShadows"
    "89006A2E.AutodeskSketchBook"
    "9E2F88E3.Twitter"
    "A278AB0D.DisneyMagicKingdoms"
    "A278AB0D.MarchofEmpires"
    "ActiproSoftwareLLC.562882FEEB491"
    "AdobeSystemsIncorporated.AdobePhotoshopExpress"
    "CAF9E577.Plex"
    "D52A8D61.FarmVille2CountryEscape"
    "D5EA27B7.Duolingo-LearnLanguagesforFree"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "DolbyLaboratories.DolbyAccess"
    "Drawboard.DrawboardPDF"
    "Facebook.Facebook"
    "flaregamesGmbH.RoyalRevolt2"
    "GAMELOFTSA.Asphalt8Airborne"
    "KeeperSecurityInc.Keeper"
    "king.com.BubbleWitch3Saga"
    "king.com.CandyCrushSodaSaga"
    "PandoraMediaInc.29680B314EFC2"
    "SpotifyAB.SpotifyMusic"
    "WinZipComputing.WinZipUniversal"
    "XINGAG.XING"

    #Unnecessary Windows 10 AppX Apps
    "Microsoft.BingNews"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.StorePurchaseApp"
    "Microsoft.Whiteboard"
    "Microsoft.WindowsAlarms"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"

    #Sponsored Windows 10 AppX Apps
    #Add sponsored/featured apps to remove in the "*AppName*" format
    "*EclipseManager*"
    "*ActiproSoftwareLLC*"
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
    "*Duolingo-LearnLanguagesforFree*"
    "*PandoraMediaInc*"
    "*CandyCrush*"
    "*BubbleWitch3Saga*"
    "*Wunderlist*"
    "*Flipboard*"
    "*Twitter*"
    "*Facebook*"
    "*Spotify*"
    "*Royal Revolt*"
    "*Sway*"
    "*Speed Test*"
    "*Dolby*"

    #Optional: Typically not removed but you can if you need to for some reason
    "*Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe*"
    "*Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe*"
    "*Microsoft.BingWeather*"
    #"*Microsoft.MSPaint*"
    "*Microsoft.MicrosoftStickyNotes*"
    "*Microsoft.Windows.Photos*"
    "*Microsoft.WindowsCalculator*"
    #"*Microsoft.WindowsStore*"

    #xbox
    "Microsoft.XboxApp"
    "Microsoft.XboxIdentityProvider" -ErrorAction SilentlyContinue
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.XboxGameOverlay"
    "Microsoft.Xbox.TCUI"

    #internet explorer
  	Disable-WindowsOptionalFeature -Online -FeatureName "Internet-Explorer-Optional-$env:PROCESSOR_ARCHITECTURE" -NoRestart -WarningAction SilentlyContinue | Out-Null
)
foreach ($Bloat in $Bloatware) {
    Get-AppxPackage -Name $Bloat| Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
    Write-Output "Trying to remove $Bloat."
}

Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) {
  New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type DWord -Value 0

Write-Output "Uninstalling Microsoft XPS Document Writer..."
Disable-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features" -NoRestart -WarningAction SilentlyContinue | Out-Null

Write-Output "Removing Default Fax Printer..."
Remove-Printer -Name "Fax" -ErrorAction SilentlyContinue
