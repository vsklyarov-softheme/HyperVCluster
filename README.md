# HyperVCluster
Contains scripts for creating Hyper-V cluster using Vagrant

```powershell
#downloads chocolatey
Set-ExecutionPolicy Bypass;
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

refreshenv;

#installs git and clone this repo
chocho install git;
git clone https://github.com/vsklyarov-softheme/HyperVCluster.git;
```
