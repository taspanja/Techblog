[CmdletBinding()]

param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 1)]
    [array]$FontList
)

$Fonts=Get-Content $FontList

Start-Transcript -Path $(Join-Path $env:TEMP "UninstallFont.log")

foreach ($Font in $Fonts)
{
try{
    Write-Output "Font file '$Font'"
    Write-Output "Deleting item: '$("$env:windir\Fonts\$Font")'"
    Remove-Item -Path "$env:windir\Fonts\$Font" -Force
    Write-Output "Deleting item: 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\$Font'"
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name $Font -Force
}catch{
    Write-Error $_
}
}

Stop-Transcript