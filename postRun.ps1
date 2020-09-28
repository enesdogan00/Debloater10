#Run this script on a Windows PE environment as admin. eg: https://www.hirensbootcd.org/
#This script is a migration of Windows Ameliorated post script for powershell.

$systemDisk="C:" #your system disks letter on Windows PE
$backupDisk="D:" #your backup disk for the windows' files(can be same as system disk)
$users=@("user1","user2") #list of users that you want their unne

Write-output "Cleaning junk..."

#moves Windows' garbage to your backup folder
mv "$systemDisk\Program Files\Internet Explorer" "$backupDisk\backup\Program Files\Internet Explorer" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files\WindowsApps" "$backupDisk\backup\Program Files\WindowsApps" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files\Windows Defender" "$backupDisk\backup\Program Files\Windows Defender" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files\Windows Security" "$backupDisk\backup\Program Files\Windows Security" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files\Windows Defender Advanced Threat Protection" "$backupDisk\backup\Program Files\Windows Defender Advanced Threat Protection" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files\Windows Mail" "$backupDisk\backup\Program Files\Windows Mail" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files\Windows Media Player" "$backupDisk\backup\Program Files\Windows Media Player" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files (x86)\Internet Explorer" "$backupDisk\backup\Program Files (x86)\Internet Explorer" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files (x86)\Windows Defender" "$backupDisk\backup\Program Files (x86)\Windows Defender" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files (x86)\Windows Mail" "$backupDisk\backup\Program Files (x86)\Windows Mail" -Force -ErrorAction "SilentlyContinue"
mv "$systemDisk\Program Files (x86)\Windows Media Player" "$backupDisk\backup\Program Files (x86)\Windows Media Player" -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\System32\wua* $backupDisk\backup\Windows\System32 -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\System32\wups* $backupDisk\backup\Windows\System32 -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\SystemApps\*CloudExperienceHost* $backupDisk\backup\Windows\SystemApps -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\SystemApps\*ContentDeliveryManager* $backupDisk\backup\Windows\SystemApps -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\SystemApps\Microsoft.MicrosoftEdge* $backupDisk\backup\Windows\SystemApps -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\SystemApps\Microsoft.Windows.Cortana* $backupDisk\backup\Windows\SystemApps -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\SystemApps\Microsoft.XboxGameCallableUI* $backupDisk\backup\Windows\SystemApps -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\diagnostics\system\Apps $backupDisk\backup\Windows\diagnostics\system -Force -ErrorAction "SilentlyContinue"
mv $systemDisk\Windows\diagnostics\system\WindowsUpdate $backupDisk\backup\Windows\diagnostics\system -Force -ErrorAction "SilentlyContinue"

foreach($user in $users) {
rm "$systemDisk\users\$users\AppData\Local\Temp" -Recurse -Force -ErrorAction "SilentlyContinue"
}

rm "$systemDisk\Windows\Temp" -Recurse -Force -ErrorAction "SilentlyContinue"
rm "$systemDisk\Windows\Prefetch" -Recurse -Force -ErrorAction "SilentlyContinue"

Write-output "Done!"
