
function InstallChocolatey() {
    Write-Host "Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))    
}

function ConfigureGlobalConfirmation() {
    Write-Host "Chocolatey - Configure Global Affirmation"
    choco feature enable -n allowGlobalConfirmation    
}

function ScheduleDailyJob() {
    Import-Module PSScheduledJob
    Write-Host "Chocolatey - Create Task to upgrade all packages daily"
    $ScheduledJob = @{
        Name = "Chocolatey StartUp Upgrade"
        ScriptBlock = {choco upgrade all -y}
        Trigger = New-JobTrigger -AtStartup -RandomDelay 00:02:00
        ScheduledJobOption = New-ScheduledJobOption -RunElevated -MultipleInstancePolicy StopExisting -RequireNetwork
    }
    Register-ScheduledJob @ScheduledJob
}

function InstallAllPackages(){
    Write-Host "Chocolatey - Install Basic Packages"
    choco install git autohotkey vscode vlc choco install powertoys microsoft-windows-terminal postman python
}

function SetupChocolatey() {
    InstallChocolatey
    ConfigureGlobalConfirmation
    ScheduleDailyJob
    InstallAllPackages
}