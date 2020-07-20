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
