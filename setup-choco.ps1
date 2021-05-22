#install choco
Write-Host "Installing/Updating Choco"
if ($null -eq (Get-Command -Name choco.exe -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    & choco update Chocolatey
}

Write-Host  "Intstalling minimal setup"
& choco install `
    7zip `
    winrar `
    vlc `
    cascadia-code-nerd-font `
    chocolateygui `
    git `
    oh-my-posh `
    microsoft-windows-terminal `
    notepadplusplus `
    powertoys `
    pwsh `
    sysinternals `
    which `
    keepass `
    vscode `
    adobereader `
    teamviewer `
    googlechrome `
    adblockpluschrome `
    greenshot `
    thunderbird `
    truecrypt `
    avirafreeantivirus `
    googledrive `
    -y


# add tools
if ((Read-Host "Install dev tools: (y/N)").ToLower() -eq 'y') {
    & choco install `
        autohotkey.install `
        azure-cli `
        docker-desktop `
        eartrumpet `
        gh `
        insomnia-rest-api-client `
        linqpad `
        nodejs-lts `
        nswagstudio `
        postman `
        sudo `
        visualstudio2019community `
        visualstudio2019-workload-netweb `
        jetbrainstoolbox `

        -y
}

if ((Read-Host "Install paid tools: (y/N)").ToLower() -eq 'y') {
    & choco install `
        -y
}

if ((Read-Host "Install other apps: (y/N)").ToLower() -eq 'y') {
    & choco install `
        paint.net `
        jdownloader `
        -y
}
