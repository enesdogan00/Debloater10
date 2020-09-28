#   Description:
# This script will use Windows package manager to bootstrap Chocolatey and
# install a list of packages. Script will also install Sysinternals Utilities
# into your default drive's root directory.

$packages = @(
    "notepadplusplus.install"
    #"peazip.install"
    "7zip.install"
    #"aimp"
    #"audacity"
    #"autoit"
    "open-shell"
    #"filezilla"
    "firefox"
    "gimp"
    #"google-chrome-x64"
    #"imgburn"
    #"keepass.install"
    #"paint.net"
    #"putty"
    #"python"
    #"qbittorrent"
    #"speedcrunch"
    #"sysinternals"
    #"thunderbird"
    "vlc"
    #"windirstat"
    #"wireshark"
    "adobereader"
    "vcredist-all"
    #"jdownloader"
    "oldcalc"
)

echo "Setting up Chocolatey software package manager"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#install packages
choco install $packages --ignore-checksums -y
