
function OpenInstallationLinks() {
    Write-Host "These softwares would have to be downloaded manually, dont install them yet. Just download the installers for now. Let's Start"

    $urls = @{
        VisualStudio = "https://visualstudio.microsoft.com/vs/"
        DockerDesktop = "https://hub.docker.com/editions/community/docker-ce-desktop-windows/"
        MicrosoftEdge = "https://www.microsoft.com/en-us/edge"
    }

    foreach($url in $urls.GetEnumerator()){
        Start-Process $url.Value
        Read-Host -Prompt "Opened: $($url.Name), When done with the download feel free to press any key: "
    }
}

function SetupExternalTools() {
    OpenInstallationLinks
}