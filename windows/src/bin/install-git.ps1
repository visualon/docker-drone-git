

. $PSScriptRoot\..\lib\index.ps1

$Version = $env:GIT_VERSION
$Name = 'git'


if ( $Version -like 'v*') {
  $Version = $Version.TrimStart('v')
}

# 2.29.2.windows.1
if ( -not ($Version -match '^(\d+\.\d+\.\d+)\.windows(\.\d+)$') ) {
  throw "Invalid $Name version"
}

$v = $Matches.1
$r = $Matches.2

if ($r -eq ".1") {
  $r = ''
}

$file = "$tmp\$Name.zip"
$app = "c:\$Name"
$url = "https://github.com/git-for-windows/git/releases/download/v$Version/MinGit-${v}${r}-busybox-64-bit.zip"

Invoke-WebRequest $url -OutFile $file

New-Item -Path $app -ItemType "directory" | Out-Null
Expand-Archive -Path $file -DestinationPath $app

exec { git config --system core.autocrlf input }
exec { git config --system core.longpaths true }
exec { git config --system http.sslbackend schannel }
exec { git config --system --replace-all credential.helper '""' }
exec { git config --system init.defaultBranch main }

Remove-Cache
