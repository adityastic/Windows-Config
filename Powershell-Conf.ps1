
function InstallCrossPlatformPowershell() {
    Write-Host "Install Powershell 7"
    Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI"
}

function SetupPowershell() {
    InstallCrossPlatformPowershell
}