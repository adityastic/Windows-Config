function GenerateAndShowGPGKeyPair() {
    Write-Host "Starting Generating a New Key Pair for this machine" -BackgroundColor Green
    gpg --default-new-key-algo rsa4096 --gen-key

    Write-Host "Finding All GPG Keys and Selecting the Top One to Display" -BackgroundColor Green
    $allGPGFound = @()
    gpg --list-secret-keys --keyid-format LONG | Where-Object{$_ -match 'sec'} | ForEach-Object { $allGPGFound = $allGPGFound + $_.Split(" ")[3].Split("/")[1] }
    Write-Host "Below is the Public Key, Please copy and add it to your GPG Settings in Github or any other provider you please" -BackgroundColor Green
    gpg --armor --export $allGPGFound[0]
    Write-Host "Above the Public Key, Please copy and add it to your GPG Settings in Github or any other provider you please" -BackgroundColor Green
    Read-Host -Prompt "Feel Free to PRESS ANY KEY once you're done with GPG Settings to continue :"
    
    SetupGitAndConfig $allGPGFound[0]
}

function SetupGitAndConfig($gpgKey){
    Write-Host "Starting Git Config for GPG and User details"
    git config --global gpg.program "$(where.exe gpg)"
    git config --global commit.gpgsign true
    git config --global user.signingkey "$gpgKey"
    git config --global user.name "Aditya Gupta"
    git config --global user.email "adityaofficialgupta@gmail.com"
}

function InstallGitAndGPG() {
    Write-Host "Installing Git and GNU Privacy Guard for Windows" -BackgroundColor Green
    choco install git gpg4win
}

function SetupGPGSinging() {
    InstallGitAndGPG
    GenerateAndShowGPGKeyPair
}