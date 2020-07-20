Write-Host "
  ___       _  _  _                  _        _____                 __ 
 / _ \     | |(_)| |                ( )      /  __ \               / _|
/ /_\ \  __| | _ | |_  _   _   __ _ |/  ___  | /  \/  ___   _ __  | |_ 
|  _  | / _  || || __|| | | | / _  |   / __| | |     / _ \ | '_ \ |  _|
| | | || (_| || || |_ | |_| || (_| |   \__ \ | \__/\| (_) || | | || |  
\_| |_/ \__,_||_| \__| \__, | \__,_|   |___/  \____/ \___/ |_| |_||_|  
                       __/ |                                          
                      |___/                                          
" 

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Chocolatey - Configure Global Affirmation"
choco feature enable -n allowGlobalConfirmation

Write-Host "Chocolatey - Create Task to upgrade all packages daily"
Import-Module PSScheduledJob
$ScheduledJob = @{
    Name = "Chocolatey StartUp Upgrade"
    ScriptBlock = {choco upgrade all -y}
    Trigger = New-JobTrigger -AtStartup -RandomDelay 00:02:00
    ScheduledJobOption = New-ScheduledJobOption -RunElevated -MultipleInstancePolicy StopExisting -RequireNetwork
}
Register-ScheduledJob @ScheduledJob

Write-Host "Chocolatey - Install Basic Packages"
choco install git autohotkey vscode vlc 