# SqueezeVideos

Squeeze videos down in size using ffmpeg.

PowerShell 7 required (for `Split-Path` `-LeafNode` option)

## Examples

    .\SqueezeVideos.ps1 -Path "C:\some-video.mp4"

    Get-ChildItem "C:\SomeVideoPath\*.MOV" | ForEach-Object { & .\SqueezeVideos.ps1 -Path "$_" }