
function InstallChocolatey() {
    Write-Host "Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))    
}

function ConfigureGlobalConfirmation() {
    Write-Host "Chocolatey - Configure Global Affirmation"
    choco feature enable -n allowGlobalConfirmation    
}

function ScheduleDailyJob() {
    Import-Module PSScheduledJob
    Import-Module ScheduledTasks
    Write-Host "Chocolatey - Create Task to upgrade all packages daily"
    $ScheduledJob = @{
        Name = "Chocolatey StartUp Upgrade"
        ScriptBlock = {  Start-Process powershell -Verb RunAs -ArgumentList "choco upgrade all" }
        Trigger = New-JobTrigger -AtLogOn -RandomDelay 00:02:00
        ScheduledJobOption = New-ScheduledJobOption -RunElevated -MultipleInstancePolicy StopExisting -RequireNetwork -StartIfOnBattery -ContinueIfGoingOnBattery
    }
    Register-ScheduledJob @ScheduledJob
    $task = Get-ScheduledTask -TaskName "Chocolatey StartUp Upgrade"
    $task.Principal = New-ScheduledTaskPrincipal -UserId "$($env:USERDOMAIN)\$($env:USERNAME)" -LogonType ServiceAccount -RunLevel Highest
    Set-ScheduledTask $task
}

function RemoveDailyJob() {
    Unregister-ScheduledJob "Chocolatey StartUp Upgrade"
}

function InstallAllPackages(){
    Write-Host "Chocolatey - Install Basic Packages"
    choco install autohotkey vscode vlc choco install powertoys microsoft-windows-terminal postman python powershell-core poshgit
}

function SetupChocolatey() {
    InstallChocolatey
    ConfigureGlobalConfirmation
    ScheduleDailyJob
    InstallAllPackages
}
