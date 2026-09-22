$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

$versionLine = Select-String -Path "..\versions.mk" -Pattern "^ALEKHANA_VERSION=(.+)$"
if (-not $versionLine) {
    Write-Error "Could not read ALEKHANA_VERSION from versions.mk"
    exit 1
}
$Version = $versionLine.Matches[0].Groups[1].Value.Trim()

$DestDir = "vendor\alekhana"

if (Test-Path "$DestDir\VERSION") {
    $existing = (Get-Content "$DestDir\VERSION" -Raw).Trim()
    if ($existing -eq $Version) {
        exit 0
    }
}

$Asset = "alekhana-windows-v$Version.zip"
$Url = "https://github.com/deepestblue/alekhana/releases/download/v$Version/$Asset"

$WorkDir = New-Item -ItemType Directory -Path ([System.IO.Path]::GetTempPath()) -Name ([System.Guid]::NewGuid())
try {
    Invoke-WebRequest -Uri $Url -OutFile "$WorkDir\$Asset"

    Expand-Archive -Path "$WorkDir\$Asset" -DestinationPath $WorkDir

    if (Test-Path $DestDir) {
        Remove-Item -Recurse -Force $DestDir
    }
    New-Item -ItemType Directory -Path $DestDir | Out-Null
    Move-Item -Path "$WorkDir\alekhana-windows-v$Version\*" -Destination $DestDir
} finally {
    Remove-Item -Recurse -Force $WorkDir
}
