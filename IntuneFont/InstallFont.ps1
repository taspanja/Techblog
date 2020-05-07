[CmdletBinding()]

param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 1)]
    [array]$FontList
)

$Fonts=Get-Content $FontList

Start-Transcript -Path $(Join-Path $env:TEMP "InstallFont.log")

foreach ($Font in $Fonts)
{
try{
    Write-Output "Font file '$Font'"
    Write-Output "Copying item to: '$("$env:windir\Fonts\$Font")'"
    Copy-Item -Path "$PSScriptRoot\$Font" -Destination "$env:windir\Fonts" -Force -PassThru -ErrorAction Stop
    Write-Output "Creating item: 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\$Font'"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name $Font -PropertyType String -Value $Font -Force
}catch{
    Write-Error $_
}
}

Stop-Transcript