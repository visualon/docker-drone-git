. $PSScriptRoot\..\lib\index.ps1

$Name='drone-git'
$Version = $env:DRONE_GIT_VERSION

if ( $Version -like 'v*') {
  $Version = $Version.TrimStart('v')
}

$file = "$tmp\$Name.zip"
$app = "$tmp\$Name"
$url = "https://github.com/drone/drone-git/archive/refs/tags/v$Version.zip"

Invoke-WebRequest $url -OutFile $file
Expand-Archive -Path $file -DestinationPath $app

Copy-Item "$app\$Name-$($Version)\windows\*.ps1" c:\bin\
