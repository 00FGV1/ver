$repoUrl = "https://api.github.com/repos/mrpond/BlockTheSpot/releases/latest"
$response = Invoke-RestMethod -Uri $repoUrl
$assetUrl = $response.assets | Where-Object { $_.name -eq "chrome_elf.zip" } | Select-Object -ExpandProperty browser_download_url
$downloadPath = "$env:TEMP\BlockTheSpot.zip"
$extractPath = "$env:TEMP\BlockTheSpot"
Invoke-WebRequest -Uri $assetUrl -OutFile $downloadPath
Expand-Archive -Path $downloadPath -DestinationPath $extractPath
$destinationPath = "C:\Users\S\AppData\Roaming\Spotify"
Copy-Item -Path "$extractPath\*" -Destination $destinationPath -Recurse -Force
Remove-Item -Path $downloadPath -Force
Remove-Item -Path $extractPath -Recurse -Force