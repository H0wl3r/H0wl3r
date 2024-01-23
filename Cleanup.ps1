#Clean up

$RemovableDrives = Get-WmiObject -Class Win32_LogicalDisk -filter "drivetype=2" | select-object -expandproperty DeviceID
ForEach ($Drive in $RemovableDrives)
{
Remove-Item -Path $Drive\T1091Test1.txt -Force -ErrorAction Ignore
}

Remove-Item -Path C:\users\$env:USERNAME\Desktop\Ransom* -Force -ErrorAction Ignore
Remove-Item -Path C:\Windows\Temp\Localenum.txt -Force -ErrorAction Ignore
Remove-Item -Path C:\Windows\Temp\Powerup.txt -Force -ErrorAction Ignore
Remove-Item -Path C:\Windows\Temp\exfilFile.txt -Force -ErrorAction Ignore
Remove-Item -Path C:\Windows\Temp\Ransom_Data.zip -Force -ErrorAction Ignore
Write-Host "[+] Clean Up Complete."
