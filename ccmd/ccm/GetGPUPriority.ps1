$regValue = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' | Select-Object -ExpandProperty 'GPU Priority'
Write-Output $regValue
