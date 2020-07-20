
function OpenInstallationLinks() {
    $urls = @(
        # Visual Studio
        "https://visualstudio.microsoft.com/vs/",
        # Docker Desktop
        "https://hub.docker.com/editions/community/docker-ce-desktop-windows/",
        # Microsoft Edge
        "https://www.microsoft.com/en-us/edge"
    )

    foreach($url in $urls){
        Start-Process $url
    }
}

function SetupExternalTools() {
    OpenInstallationLinks
}