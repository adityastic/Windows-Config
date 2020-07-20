Import-Module ".\Chocolatey-Conf.ps1"
Import-Module ".\Powershell-Conf.ps1"
Import-Module ".\ExternalTools-Conf.ps1"

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

SetupChocolatey
SetupPowershell
SetupExternalTools