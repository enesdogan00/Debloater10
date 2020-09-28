read-host("Close every software you can and press enter")

echo "Free disk space before running the script:" ((Get-PSDrive C | ForEach-Object Free)/1024/1024)

Remove-Item  "$env:SystemDrive\users\*\AppData\Local\Temp\*" -Force -Recurse
Remove-Item  "$env:SystemDrive\Windows\Temp\*"  -Force -Recurse
Remove-Item  "$env:SystemDrive\Windows\Logs\CBS\*" -Force -Recurse
Remove-Item  "$env:SystemDrive\swtools\*"  -Force -Recurse
Remove-Item  "$env:SystemDrive\Windows\Prefetch\*" -Force -Recurse
Remove-Item  "$env:SystemDrive\Windows\SoftwareDistribution\Dwnload\*" -Force -Recurse
Remove-Item  "$env:SystemDrive\users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Force -Recurse
Remove-Item  "$env:SystemDrive\PerfLogs\*" -Force -Recurse
Remove-Item  "$env:windir\memory.dmp" -Force -Recurse
Remove-Item  "$env:windir\ProgramData\Microsoft\Windows\WER\*" -Force -Recurse
Remove-Item  "$env:windir\minidump\*" -Force -Recurse
Remove-Item  "$env:SystemDrive\Users\*\AppData\Local\Microsoft\Windows\WER*\" -Force -Recurse
Remove-Item  "$env:SystemDrive\Users\*\AppData\Local\Microsoft\Windows\INetCache\*" -Force -Recurse
Remove-Item  "$env:SystemDrive\$Recycle.Bin" -Force -Recurse

cleanmgr /sagerun:1  /verylowdisk 
sleep 30

echo "Free disk space after running the script:" ((Get-PSDrive C | ForEach-Object Free)/1024/1024)