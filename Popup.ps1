
Add-Type -AssemblyName System.Windows.Forms
$cycles = 100
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
