#Requires -Version 5.1

# used to silence warnings
Set-Variable -Name tmp -Value "c:\TEMP"
New-Item -Path $tmp -ItemType "directory" | Out-Null

$lib = $PSScriptRoot
. $lib\exec.ps1
. $lib\cache.ps1
