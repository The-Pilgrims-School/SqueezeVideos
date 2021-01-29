#
# SqueezeVideos
#
# Requires PowerShell 7
#
param(
    [string]$Path,
    [int]$Crf = 25,
    [string]$Scale = "1280:-1"
)

$ErrorActionPreference="Stop"

$baseName = ($Path | Split-Path -LeafBase)
$origPath = ($Path | Split-Path -Parent)

ffmpeg -i "$Path" -crf $Crf -vf scale=$Scale "$env:TEMP\$baseName.m4v"

if ($LASTEXITCODE -eq 0) {
    Remove-Item -Force "$Path"
    Copy-Item -Force "$env:TEMP\$baseName.m4v" "$Path\$baseName.m4v"
    Remove-Item -Force "$env:TEMP\$baseName.m4v"
}
else {
    Write-Warning "ffmpeg failed with $LASTEXITCODE"
}